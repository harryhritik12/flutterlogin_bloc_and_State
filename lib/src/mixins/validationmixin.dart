mixin class  ValidationMixin{


String? ValidatingEmail (String? value){
          if(!value!.contains('@')){
            return 'Please enter a valid email address';
          }
          return null;

          
       } 


String? ValidatingPassword(String ?value){
        if(value!.length<4){
            return 'Password must be at least 4 characters';
        }
        return null;
      }

}