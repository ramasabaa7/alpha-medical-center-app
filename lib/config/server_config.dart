class Serverconfig{
  static const domainnameserver ='https://ultimatebyteos.com';
  //apis YOUSSEF
  static const signin ='$domainnameserver/api/login';
  static const register ='$domainnameserver/api/register';
  static const patient_regestration ='$domainnameserver/api/patientRegistration';
  static const get_patient_info ='$domainnameserver/api/getPatientInformation';
  static const get_patient_visits ='$domainnameserver/api/getVisitsPatientUseIDPatientRecord';
  static const get_patient_visits_details ='$domainnameserver/api/getVisitPatientUseID';
  static const add_preview_resault ='$domainnameserver/api/addPreviewResults';
  static const update_preview_reult ='$domainnameserver/api/updatePreviewResults';
  static const delete_preview_reult ='$domainnameserver/api/deletePreviewResults';
  static const add_pervious_medical_condition ='$domainnameserver/api/addPreviousMedicalCondition';
  static const get_pervious_medical_condition ='$domainnameserver/api/getPreviousMedicalCondition';
  static const update_pervious_medical_condition ='$domainnameserver/api/updatePreviousMedicalCondition';
  static const patient_reservation_registeration ='$domainnameserver/api/patientReservationRegistration';
  // static const getalldoctor ='$domainnameserver/api/getAllDoctors';
  static const getalldoctor_in_type_service ='$domainnameserver/api/getAllUserInThisTypes';
  static const get_view_doctor_booking ='$domainnameserver/api/getViewDoctorBookings';
  static const update_patient_reservation ='$domainnameserver/api/updatePatientReservation';
  static const delete_patient_reservation ='$domainnameserver/api/deletePatientReservation';
  static const get_all_join_reqiest ='$domainnameserver/api/getAllJoinRequest';
  static const accept_join_request ='$domainnameserver/api/acceptJoinRequest';
  static const reject_join_request ='$domainnameserver/api/rejectJoinRequest';
  static const visit_registration ='$domainnameserver/api/visitRegistration';
  static const update_visit ='$domainnameserver/api/updateVisit';
  static const get_all_type_user ='$domainnameserver/api/typeuser/index'; //for helping
  static const get_all_section ='$domainnameserver/api/getAllSections'; //for helping
  static const get_all_salary_increase_request ='$domainnameserver/api/getAllSalaryIncrease';
  static const accept_salary_increase_request ='$domainnameserver/api/AcceptSalary';
  static const reject_salary_increase_request ='$domainnameserver/api/removeSalaryIncrease';
  static const get_salary ='$domainnameserver/api/getSalary';
  static const get_all_section_in_manager ='$domainnameserver/api/getAllSections';
  static const add_new_section ='$domainnameserver/api/addSection';
  static const delete_section ='$domainnameserver/api/deleteSection';
  static const update_section ='$domainnameserver/api/updateSection';
  static const get_all_type_section ='$domainnameserver/api/getAllTypesOfSection';
  static const logout ='$domainnameserver/api/logout';
  static const add_type_center_services ='$domainnameserver/api/addTypeCenterServices';
  static const delete_type_center_services ='$domainnameserver/api/removeTypeCenterServices';
  static const update_type_center_services ='$domainnameserver/api/updateTypeCenterServices';
  static const get_all_services_in_type_center ='$domainnameserver/api/getAllServiceCenterByTypeCenter';
  static const add_services_in_type_center ='$domainnameserver/api/addServiceToCenter';
  static const delete_services_in_type ='$domainnameserver/api/deleteCenterServices';
  static const update_services_in_type ='$domainnameserver/api/updateCenterServices';
  static const get_user_info_by_id ='$domainnameserver/api/getUserInfoByID';
  static const get_all_required_services_for_patient ='$domainnameserver/api/getPatientServices';
  static const add_service_for_patient ='$domainnameserver/api/addPatientServices';
  static const get_all_center_service ='$domainnameserver/api/getAllCenterService';
  static const delete_service_for_patient ='$domainnameserver/api/removePatientServices';
  static const download_xray ='$domainnameserver/api/downloadX_Rays';
  static const get_user_in_section ='$domainnameserver/api/getUsersBySection';
  static const get_all_type_services_in_center ='$domainnameserver/api/getAllTypesCenterServices';
  static const get_wating_request_by_typeservice ='$domainnameserver/api/getAllWaitRequestByTypeCenterServices';
  static const get_patient_info_by_id ='$domainnameserver/api/getPatientInformationByID';
  static const get_all_roles ='$domainnameserver/api/listRoles';
  static const get_user_info ='$domainnameserver/api/getMyUserInfo';
  static const get_all_available_service ='$domainnameserver/api/getAllCenterServiceAvailable';
  static const edit_profile_info ='$domainnameserver/api/UpdateMyUserInfo';
  static const change_status_type_service ='$domainnameserver/api/changeStatus';
  // finance section youssef//
  static const get_all_bills ='$domainnameserver/api/getAllBills';

  static const get_all_insurance_company ='$domainnameserver/api/getAllInsuranceCompany';
  static const remove_insurance_compnay ='$domainnameserver/api/removeInsuranceCompany';
  static const edit_insurance_company ='$domainnameserver/api/updateInsuranceCompany';
  static const add_insurance_company ='$domainnameserver/api/addInsuranceCompany';
  static const get_all_patient_services_in_financial ='$domainnameserver/api/getAllVisitsThatDoNotHaveBill';
  static const add_bill ='$domainnameserver/api/addBill';
  static const add_receipts ='$domainnameserver/api/addReceipts';
  static const get_all_patient_bills ='$domainnameserver/api/getAllBillsOfPatientByIDPersonal';
  static const delete_bill ='$domainnameserver/api/removeBill';
  static const get_patient_service_by_visite_id ='$domainnameserver/api/getPatientServicesByVisitID';
  static const delete_services_not_complete ='$domainnameserver/api/deleteServicePatientNotComplete';
  static const get_all_receipts ='$domainnameserver/api/getAllReceipts';
  static const get_bill_details ='$domainnameserver/api/getBill';
  static const delete_receipts ='$domainnameserver/api/removeReceipts';
  static const update_receipts ='$domainnameserver/api/updateReceipts';
  static const update_bill ='$domainnameserver/api/updateBill';

  static const get_all_maintenance_request ='$domainnameserver/api/getAllMaintenanceRequests';
  static const add_mainteance_request ='$domainnameserver/api/addMaintenanceRequests';
  static const update_maintenance_request ='$domainnameserver/api/updateMaintenanceRequests';
  static const delete_main_tenance_request ='$domainnameserver/api/removeMaintenanceRequests';
  static const get_myuser_info ='$domainnameserver/api/getMyUserInfo';
  static const get_all_material_in_center ='$domainnameserver/api/getAllCenterMaterial';
  static const change_material_price ='$domainnameserver/api/changeMaterialPrice';
  static const change_salary_user ='$domainnameserver/api/changeSalaryUser';
  static const pay_back ='$domainnameserver/api/payBackWhenCancelingTheBill';
  static const get_all_payments_maintenance ='$domainnameserver/api/getPaymentsMaintenanceRequests';
  static const delete_payments ='$domainnameserver/api/removePayments';
  static const add_payments_maintenance_req ='$domainnameserver/api/addPaymentsMaintenanceRequests';
  static const get_all_payment ='$domainnameserver/api/getAllPayments';
  static const add_salary_increase_from_reception ='$domainnameserver/api/addSalaryIncrease';
  static const update_payments_maintenance ='$domainnameserver/api/updatePayments';
  static const get_all_user_status ='$domainnameserver/api/listStatusUsers';
  static const get_all_order_incomplete ='$domainnameserver/api/getAllOrdersInComplete';
  static const accept_or_reject_item_request ='$domainnameserver/api/AcceptOrRejectItemRequest';
  static const get_all_order_complete ='$domainnameserver/api/getAllOrdersComplete';
  static const add_payments_orders ='$domainnameserver/api/addPaymentsOrdersAndConsumable';
  static const get_all_payments_orders ='$domainnameserver/api/getPaymentsOrdersAndConsumable';
  static const update_user_staus ='$domainnameserver/api/updateUserStatus';
  static const get_all_item_in_order ='$domainnameserver/api/getAllItemByOrderInComplete';
  static const get_all_item_in_order_complete ='$domainnameserver/api/getAllItemByOrderComplete';
  static const completeRequiredPatientServices ='$domainnameserver/api/completeRequiredPatientServices';








































  //end finance api //
  // END API YOUSSEF
  static const get_Patient_Services ='$domainnameserver/api/getPatientServices';
  static const get_Users_ByType ='$domainnameserver/api/getUsersByType';
  static const add_Follower ='$domainnameserver/api/addFollower';
  static const get_List_Follower_After_Today ='$domainnameserver/api/getListFollowerAfterToday';
  static const get_User_Info_By_ID ='$domainnameserver/api/getUserInfoByID';
  static const get_All_Wait_Request_ByType_Center_Services ='$domainnameserver/api/getAllWaitRequestByTypeCenterServices';
  static const get_Patient_Information_ByID ='$domainnameserver/api/getPatientInformationByID';
  static const get_Type_Center_Services ='$domainnameserver/api/getTypeCenterServices';
  static const get_ViewDoctorBookings ='$domainnameserver/api/getViewDoctorBookings';
  static const personal_information ='$domainnameserver/api/getPatientInformation?Key=ID Personal&Value=0254516459816';
  static const upload_Xray ='$domainnameserver/api/addX_Rays';
  static const getwaitRequest ='$domainnameserver/api/getAllWaitRequestByTypeCenterServices';
  static const typeServicexray ='$domainnameserver/api/getAllTypesOfSection?id_section=11';
  static const getinformationbyId  ='$domainnameserver/api/getPatientInformationByID?id=';
  static const gitvisitsbyid ='$domainnameserver/api/getVisitsPatientUseIDPatientRecord?IDPatientRecord=';
  static const typeServicelab ='$domainnameserver/api/getAllTypesOfSection?id_section=5';
  static const addlabtest ='$domainnameserver/api/addLaboratoryTest';
  static const deletetest ='$domainnameserver/api/removeLaboratoryTest';
  static const deletexray ='$domainnameserver/api/deleteX_Rays';
  static const changestatus ='$domainnameserver/api/changeStatus';
  static const changeStatus ='$domainnameserver/api/changeStatus';
  static const add_Salary_Increase ='$domainnameserver/api/addSalaryIncrease';
  static const get_MyUser_Info ='$domainnameserver/api/getMyUserInfo';
  static const getmatirial ='$domainnameserver/api/getAllCenterMaterial';
  static const Addmatirial ='$domainnameserver/api/addMaterial';
  static const updatematirial ='$domainnameserver/api/updateCenterMaterial';
  static const Trash ='$domainnameserver/api/getAllItemsRequestDateExpired';
  static const Need ='$domainnameserver/api/getAllItemsLessLimit';
  static const Addorder ='$domainnameserver/api/addOrder';
  static const Additem ='$domainnameserver/api/addItemRequest';
  static const Archivec ='$domainnameserver/api/getAllConsumableComplete';
  static const deletematirial ='$domainnameserver/api/deleteItemsRequestDateExpired?ItmeRequest_id=';
  static const ordermatirialbysection ='$domainnameserver/api/getAllConsumableInCompleteBySection?';
  static const Accept ='$domainnameserver/api/AcceptOrRejectItemRequest?Status=1&itemRequestId=';




























































}
