'use strict';
     
const ChartsEffectiveness = function () {

    const initInput = function () {
      $('input[name="range_date"]').daterangepicker({
            // singleDatePicker: true,
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

      $('input[name="range_date_1"]').daterangepicker({
            // singleDatePicker: true,
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

      $('#id_process_1').select2({
        allowClear: true,
        placeholder: 'Todos los procesos',
        language: 'es',
      });
    };

    const initChartProcess = function () {
        am4core.useTheme(am4themes_animated);

        const chart = am4core.create("chartProcess", am4charts.XYChart);
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
                }, {
                    "label": "Print", "type": "print"
                }
            ]
        }];

        chart.language.locale = am4lang_es_ES;
        chart.logo.disabled = true;

        var title = chart.titles.create();
        title.text = "Eficacia del proceso " + $('#id_process option:selected').text();
        title.fontSize = 25;
        title.marginBottom = 30;

        chart.dataSource.url = get_chartprocess_data;
        chart.dataSource.parser = new am4core.JSONParser();
        chart.dataSource.parser.options.emptyAs = 0;

        chart.dataSource.adapter.add("url", function(url, target) {
          if ($('#id_range_date').val()) {
            url += "?range=" + $('#id_range_date').val();
          }
          if($('#id_process').val()) {
              url += "&process=" + $('#id_process').val();
          }
          return url;
        });

        const categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
        categoryAxis.renderer.grid.template.location = 0;
        categoryAxis.renderer.ticks.template.disabled = true;
        categoryAxis.renderer.line.opacity = 0;
        categoryAxis.renderer.grid.template.disabled = true;
        categoryAxis.renderer.minGridDistance = 40;
        categoryAxis.dataFields.category = "year";

        const valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
        valueAxis.tooltip.disabled = true;
        valueAxis.renderer.line.opacity = 0;
        valueAxis.renderer.ticks.template.disabled = true;
        valueAxis.min = 0;

        function createSeries(field, name) {
            var series = chart.series.push(new am4charts.ColumnSeries());
            series.dataFields.valueY = field;
            series.dataFields.categoryX = "year";
            series.name = name;
            series.columns.template.tooltipText = "{name}: [bold]{valueX}[/]";
            series.columns.template.height = am4core.percent(100);
            series.sequencedInterpolation = true;

            var valueLabel = series.bullets.push(new am4charts.LabelBullet());
            valueLabel.label.text = "{valueY}";
            valueLabel.label.verticalCenter = "right";
            valueLabel.label.dy = 10;
            valueLabel.label.hideOversized = false;
            valueLabel.label.truncate = false;
        }

        createSeries("expenses", "1er. Semestre");
        createSeries("income", "2do. Semestre");

        chart.legend = new am4charts.Legend();
//        chart.scrollbarX = new am4core.Scrollbar();

        $('#id_process').on('change', function () {
           chart.dataSource.load();
           title.text = "Eficacia del proceso " + $('#id_process option:selected').text();
        });

        $('#id_range_date').on('apply.daterangepicker', function(ev, picker) {
          chart.dataSource.load();
        });

        $('#filtered').on('click', function () {
           chart.dataSource.load();
        });
    };

    const initChartSig = function () {
        am4core.useTheme(am4themes_animated);

        var chart = am4core.create("chartSig", am4charts.XYChart);
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
                }, {
                    "label": "Print", "type": "print"
                }
            ]
        }];

        chart.language.locale = am4lang_es_ES;
        chart.logo.disabled = true;

        var title = chart.titles.create();
        title.text = "Indicadores de eficacia por procesos de " + $('#id_range_date_1').val().split(' | ')[0].split('-')[0] + " - " + $('#id_range_date_1').val().split(' | ')[1].split('-')[0];
        title.fontSize = 25;
        title.marginBottom = 30;

        chart.dataSource.url = get_chartprocess_teacher_data;
        chart.dataSource.parser = new am4core.JSONParser();
        chart.dataSource.parser.options.emptyAs = 0;

        chart.dataSource.adapter.add("url", function(url, target) {
          if ($('#id_range_date_1').val()) {
            url += "?range=" + $('#id_range_date_1').val();
          }
          if($('#id_process_1').val()) {
              url += "&process=" + $('#id_process_1').val();
          }
          return url;
        });

        var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
        categoryAxis.dataFields.category = "year";
        categoryAxis.renderer.minGridDistance = 30;
        categoryAxis.renderer.labels.template.rotation = -45;

        var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
        valueAxis.min = 0;

        var lineSeries = chart.series.push(new am4charts.LineSeries());
        lineSeries.name = "Evaluación";
        lineSeries.dataFields.valueY = "expenses";
        lineSeries.dataFields.categoryX = "year";

        lineSeries.stroke = am4core.color("#007bff");
        lineSeries.strokeWidth = 3;
        lineSeries.propertyFields.strokeDasharray = "lineDash";
        lineSeries.tooltip.label.textAlign = "middle";

        var bullet = lineSeries.bullets.push(new am4charts.Bullet());
        bullet.fill = am4core.color("#007bff");
        bullet.tooltipText = "[#fff font-size: 15px]{name} en el {categoryX}:\n[/][#fff font-size: 20px]{valueY}[/] [#fff]{additional}[/]"
        var triangle = bullet.createChild(am4core.Triangle);
        triangle.horizontalCenter = "middle";
        triangle.verticalCenter = "middle";
        triangle.stroke = am4core.color("#fff");
        triangle.direction = "top";
        triangle.width = 15;
        triangle.height = 15;

        let labelBullet = lineSeries.bullets.push(new am4charts.LabelBullet());
        labelBullet.label.text = "{expenses}";
        labelBullet.label.dy = -15;

        chart.scrollbarX = new am4core.Scrollbar();

        $('#id_process_1').on('change', function () {
           chart.dataSource.load();
        });

        $('#id_range_date_1').on('apply.daterangepicker', function(ev, picker) {
          chart.dataSource.load();
          var text = "Indicadores de eficacia por procesos de ";
          text +=  $('#id_range_date_1').val().split(' | ')[0].split('-')[0] === $('#id_range_date_1').val().split(' | ')[1].split('-')[0] ? $('#id_range_date_1').val().split(' | ')[0].split('-')[0] : $('#id_range_date_1').val().split(' | ')[0].split('-')[0] + " - " + $('#id_range_date_1').val().split(' | ')[1].split('-')[0];
          title.text = text;
        });

        $('#filtered_1').on('click', function () {
           chart.dataSource.load();
        });

    };

    return {
        init: function () {
            initInput();
            initChartProcess();
            initChartSig();
        }
    };
}();

$(document).ready(function() {
    ChartsEffectiveness.init();
});