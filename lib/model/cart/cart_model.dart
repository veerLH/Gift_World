import 'package:flutter/foundation.dart';

class cartModel with ChangeNotifier{

  List<Map<String,dynamic>> item=[];
  
    bool productcheck=false;
    double totalcost=0;
      int qty;

  void addproduct(product){
      item.forEach((item_list){
        if(item_list['id']==product['id']){
          productcheck=true;
        }
      });
      if(productcheck){
        updateproduct(product);

      }else{
        item.add(product);
      }
      claculatetotal();
      notifyListeners();
    }


    void removeproduct(product){

      item.forEach((item_list){
        if(item_list['id']==product['id']){
          if(item_list['qty']>1){
            item_list['qty']=item_list['qty']-1;
          }

          productcheck=false;
        }
      });
      claculatetotal();
      notifyListeners();
    }

    void deleteproduct(product){
      item.removeWhere((item) => item['id'] == product['id']);
//      item.forEach((item_list){
//        if(item_list['id']==product['id']){
//          item_list.remove(product);
//          print(item.length);
//        }
//
//      });

//      claculatetotal(product: product);
      notifyListeners();
    }

    void updateproduct(product){

      item.forEach((item_list){
        if(item_list['id']==product['id']){
          item_list['qty']=item_list['qty']+1;
          productcheck=false;
        }
      });

    }

    void claculatetotal(){
      totalcost = 0;
        item.forEach((cost) {
          qty =cost['qty'];
          totalcost +=  double.tryParse(cost['price']) * qty;

        });
     notifyListeners();
      }

  void  claculatetotal_zin({List<Map<String,dynamic>> product}){
    totalcost = 0;
    product.forEach((cost) {
      qty =cost['qty'];
      totalcost +=  double.tryParse(cost['price']) * qty;

    });
    notifyListeners();
  }

  void clearproduct(){

        item=[];

        notifyListeners();
  }


}