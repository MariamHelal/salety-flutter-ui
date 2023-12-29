class CartModel{
  late final int? id;
  final String? productId;
  final String image;
  final String productName;
  final String productQuantity;
  final double productPrice;
  final int numbersOfProduct ;
  final double totalPriceOfProduct;

  CartModel( {
    required this.id,
    required this.productId,
    required this.numbersOfProduct,
    required this.image,
    required this.productName,
    required this.productQuantity,
    required this.productPrice,
    required this.totalPriceOfProduct,
  } );
  CartModel.fromMap(Map<dynamic, dynamic> res)
      : productId=res['productId'],
        image = res['image'],
        id = res['id'],
        productName = res['productName'],
        productQuantity = res['productQuantity'],
        productPrice = res['productPrice'],
        numbersOfProduct = res['numbersOfProduct'],
        totalPriceOfProduct = res['totalPriceOfProduct'];
  Map<String, Object?> toMap() {
    return {
      'image': image,
      'productId':productId,
      'id': id,
      'productName': productName,
      'productQuantity': productQuantity,
      'productPrice': productPrice,
      'numbersOfProduct': numbersOfProduct,
      'totalPriceOfProduct': totalPriceOfProduct,
    };
  }
}