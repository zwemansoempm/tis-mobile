mixin AppValidation {
  String validateName (String value) {
    if(value.isEmpty) {
      return "※入力は必須です。";
    }
    return null;
  }

  String validatePhone (String value) {
    if(value.isEmpty) {
      return "※入力は必須です。";
    }else if(value.isNotEmpty && value.length < 10){
      return "※電話番号が正しくありません。もう一度入力してください。";
    }
    return null;
  }

  String validateEmail (String value) {
    if(value.isNotEmpty && !value.contains(new RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9\-\_]+(\.[a-zA-Z]+)*$"))){
      return "※メールアドレスが正しくありません。もう一度入力してください。";
    }
    return null;
  }

  String validateFuri (String value) {
    if(value.isEmpty) {
      return "※入力は必須です。";
    }else if (!value.contains(new RegExp(r'/[ぁ-ゔ]+|[ァ-ヴー]+|[a-zA-Z0-9]+/u'))){
      return "※カタカナで入力してください。";
    }
    return null;
  }
}