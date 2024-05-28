'use strict';
     
const ChartsComplaints = function () {

    const initInput = function () {
      $('input[name="range_date"]').daterangepicker({
            showDropdowns: true,
            startDate: moment().subtract(5, 'year').startOf('year'),
            endDate: moment().endOf('year'),
            maxYear: moment().year(),
            locale: {
                format: 'Y-M-DD',
                separator: ' | ',
                applyLabel: 'Aplicar',
                cancelLabel: 'Cancelar',
                weekLabel: 'W',
                customRangeLabel: 'Personalizado',
                daysOfWeek: moment.weekdaysMin(),
                monthNames: moment.monthsShort()
            },
            ranges: {
               'Hasta la fecha': [moment().subtract(5, 'year').startOf('year'), moment().endOf('year')],
               'Desde el año anterior': [moment().subtract(1, 'year').startOf('year'), moment().endOf('year')],
               'Año actual': [moment().startOf('year'), moment().endOf('year')],
            }
        });
    };

    const initChartComplaint = function () {
        am4core.useTheme(am4themes_animated);

        const chart = am4core.create("chartComplaints", am4charts.RadarChart);
        chart.exporting.menu = new am4core.ExportMenu();
        chart.exporting.menu.items = [{
            "label": "...",
            "menu": [
                {
                    "label": "Image",
                    "menu": [
                        {"type": "png", "label": "PNG"},
                        {"type": "jpg", "label": "JPG"},
                        {"type": "svg", "label": "SVG"}
                    ]
                },
                {
                    "label": "Print", "type": "print"
                }
            ]
        }];

        chart.language.locale = am4lang_es_ES;
        chart.logo.disabled = true;

        let title = chart.titles.create();
        title.text = "Quejas por estados";
        title.fontSize = 25;
        title.marginBottom = 30;

        chart.startAngle = -90;
        chart.endAngle = 180;
        chart.innerRadius = am4core.percent(20);

        chart.numberFormatter.numberFormat = "#.#'%'";

        chart.dataSource.url = get_chartcomplaint_data;
        chart.dataSource.parser = new am4core.JSONParser();
        chart.dataSource.parser.options.emptyAs = 0;

        chart.dataSource.adapter.add("url", function(url, target) {
          if ($('#id_range_date').val()) {
            url += "?range=" + $('#id_range_date').val();
          }
          return url;
        });

        var categoryAxis = chart.yAxes.push(new am4charts.CategoryAxis());
        categoryAxis.dataFields.category = "category";
        categoryAxis.renderer.grid.template.location = 0;
        categoryAxis.renderer.grid.template.strokeOpacity = 0;
        categoryAxis.renderer.labels.template.horizontalCenter = "right";
        categoryAxis.renderer.labels.template.fontWeight = 500;
        categoryAxis.renderer.labels.template.adapter.add("fill", function(fill, target) {
          return (target.dataItem.index >= 0) ? chart.colors.getIndex(target.dataItem.index) : fill;
        });
        categoryAxis.renderer.minGridDistance = 10;

        var valueAxis = chart.xAxes.push(new am4charts.ValueAxis());
        valueAxis.renderer.grid.template.strokeOpacity = 0;
        valueAxis.min = 0;
        valueAxis.max = 100;
        valueAxis.strictMinMax = true;

        var series1 = chart.series.push(new am4charts.RadarColumnSeries());
        series1.dataFields.valueX = "full";
        series1.dataFields.categoryY = "category";
        series1.clustered = false;
        series1.columns.template.fill = new am4core.InterfaceColorSet().getFor("alternativeBackground");
        series1.columns.template.fillOpacity = 0.08;
        series1.columns.template.cornerRadiusTopLeft = 20;
        series1.columns.template.strokeWidth = 0;
        series1.columns.template.radarColumn.cornerRadius = 20;

        var series2 = chart.series.push(new am4charts.RadarColumnSeries());
        series2.dataFields.valueX = "value";
        series2.dataFields.categoryY = "category";
        series2.clustered = false;
        series2.columns.template.strokeWidth = 0;
        series2.columns.template.tooltipText = "{category}: [bold]{amount.formatNumber('#')}[/]";
        series2.columns.template.radarColumn.cornerRadius = 20;

        series2.columns.template.adapter.add("fill", function(fill, target) {
          return chart.colors.getIndex(target.dataItem.index);
        });

        chart.cursor = new am4charts.RadarCursor();

        $('#id_range_date').on('apply.daterangepicker', function(ev, picker) {
          chart.dataSource.load();
        });

        $('#filtered').on('click', function () {
           chart.dataSource.load();
        });
    };

    return {
        init: function () {
            initInput();
            initChartComplaint();
        }
    };
}();

$(document).ready(function() {
    ChartsComplaints.init();
});