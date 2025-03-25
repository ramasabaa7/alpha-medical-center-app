import 'package:project_after_update/core/class/StatusRequest.dart';

handlingdata(response) {
  if (response is StatusRequest) {
    return response;
  }
  else {
    if(response['message'] != null){
      return StatusRequest.failure;
    }else
    return StatusRequest.succes;
  }
}
