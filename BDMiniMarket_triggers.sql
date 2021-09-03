-----Trigger
Create TRIGGER [dbo].[producto_trigger] 
ON [dbo].[tbproducto] 
AFTER UPDATE AS

BEGIN
  
  SET NOCOUNT ON

   DECLARE @Id INT
   SET @Id = (SELECT ID FROM INSERTED)

   DECLARE @NombreAnterior nvarchar(100)
   SET @NombreAnterior = (SELECT NombreProducto FROM DELETED)


   DECLARE @CantidadAnterior int
   SET @CantidadAnterior = (SELECT Cantidad FROM DELETED)

   DECLARE @PrecioUnitarioAnterior float
   SET @PrecioUnitarioAnterior = (SELECT PrecioUnitario FROM DELETED)
   
   DECLARE @MedidaAnterior nvarchar(10)
   SET @MedidaAnterior = (SELECT Medida FROM DELETED)
   
   DECLARE @IDProveedorAnterior int
   SET @IDProveedorAnterior = (SELECT IDProveedor FROM DELETED)
   DECLARE @Proveedor nvarchar(200)
   SET @Proveedor = (SELECT Nombre FROM tbproveedor WHERE ID = @IDProveedorAnterior)
   
   DECLARE @IDMarcaAnterior int
   SET @IDMarcaAnterior = (SELECT IDMarca FROM DELETED)
   DECLARE @MARCA nvarchar(200)
   SET @MARCA = (SELECT Nombre FROM tbmarca WHERE ID = @IDMarcaAnterior)

   DECLARE @IDCategoriaProductoAnterior int
   SET @IDCategoriaProductoAnterior = (SELECT IDCategoriaProducto FROM DELETED)
   DECLARE @CATEGORIA nvarchar(200)
   SET @CATEGORIA = (SELECT Categoria FROM tbcategoriaprod WHERE ID = @IDCategoriaProductoAnterior)


   insert into tbproductohistorico values((Select GETDATE()), @Id, @NombreAnterior, @CantidadAnterior, @PrecioUnitarioAnterior, 
   @Proveedor, @MARCA, @MedidaAnterior, @CATEGORIA, 'actualizar')



END;
