from django.urls import path
from apps.iproperty.views import list_products, create_products, update_products, activate_products, delete_products, \
    list_patents, create_patents, update_patents, activate_patents, delete_patents, \
    list_drawings, create_drawings, update_drawings, activate_drawings, delete_drawings, \
    list_typelegaldocument, create_typelegaldocument, update_typelegaldocument, activate_typelegaldocument, delete_typelegaldocument, \
    list_figurative, create_figurative, update_figurative, activate_figurative, delete_figurative, \
    list_properties, details_property, create_property, update_property, delete_property, export_property


urlpatterns = [
    # Products
    path('listar/clasificacion_productos/', list_products, name='list_products'),
    path('crear/clasificacion_producto/', create_products, name='create_products'),
    path('modificar/clasificacion_producto/<int:product_id>/', update_products, name='update_products'),
    path('activar/clasificacion_producto/<int:product_id>/', activate_products, name='activate_products'),
    path('eliminar/clasificacion_producto/<int:product_id>/', delete_products, name='delete_products'),

    # Patents
    path('listar/patentes/', list_patents, name='list_patents'),
    path('crear/patente/', create_patents, name='create_patents'),
    path('modificar/patente/<int:patent_id>/', update_patents, name='update_patents'),
    path('activar/patente/<int:patent_id>/', activate_patents, name='activate_patents'),
    path('eliminar/patente/<int:patent_id>/', delete_patents, name='delete_patents'),

    # Figurative
    path('listar/clasificacion_figurativos/', list_figurative, name='list_figurative'),
    path('crear/clasificacion_figurativo/', create_figurative, name='create_figurative'),
    path('modificar/clasificacion_figurativo/<int:figurative_id>/', update_figurative, name='update_figurative'),
    path('activar/clasificacion_figurativo/<int:figurative_id>/', activate_figurative, name='activate_figurative'),
    path('eliminar/clasificacion_figurativo/<int:figurative_id>/', delete_figurative, name='delete_figurative'),

    # Drawings
    path('listar/dibujos/', list_drawings, name='list_drawings'),
    path('crear/dibujo/', create_drawings, name='create_drawings'),
    path('modificar/dibujo/<int:drawing_id>/', update_drawings, name='update_drawings'),
    path('activar/dibujo/<int:drawing_id>/', activate_drawings, name='activate_drawings'),
    path('eliminar/dibujo/<int:drawing_id>/', delete_drawings, name='delete_drawings'),

    # TypeLegalDocument
    path('listar/tipo_documento_legal/', list_typelegaldocument, name='list_typelegaldocument'),
    path('crear/tipo_documento_legal/', create_typelegaldocument, name='create_typelegaldocument'),
    path('modificar/tipo_documento_legal/<int:typelegaldocument_id>/', update_typelegaldocument, name='update_typelegaldocument'),
    path('activar/tipo_documento_legal/<int:typelegaldocument_id>/', activate_typelegaldocument, name='activate_typelegaldocument'),
    path('eliminar/tipo_documento_legal/<int:typelegaldocument_id>/', delete_typelegaldocument, name='delete_typelegaldocument'),

    # Properties
    path('listar/propiedades/', list_properties, name='list_properties'),
    path('detalles/propiedad/<int:property_id>/', details_property, name='details_property'),
    path('crear/propiedad/', create_property, name='create_property'),
    path('modificar/propiedad/<int:property_id>/', update_property, name='update_property'),
    path('eliminar/propiedad/<int:property_id>/', delete_property, name='delete_property'),
    path('exportar/propiedades/', export_property, name='export_property'),
]
