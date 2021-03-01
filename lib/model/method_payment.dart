class MethodPayment {
  int id;
  int profileId;
  String paymentName;
  String expenseMoving;
  String monthlyFees;
  String livingRoomType;
  String area;
  int details;
  String deposit;
  String otherUse;
  String rent;
  String adminExpense;
  String foodExpense;
  String nurseCareSurcharge;
  String otherMonthlyCost;
  String refundSystem;
  String depreciationPeriod;
  String initialDeprecration;
  String otherMessageRefund;

  MethodPayment(
    this.id,
    this.profileId,
    this.paymentName,
    this.expenseMoving,
    this.monthlyFees,
    this.livingRoomType,
    this.area,
    this.details,
    this.deposit,
    this.otherUse,
    this.rent,
    this.adminExpense,
    this.foodExpense,
    this.nurseCareSurcharge,
    this.otherMonthlyCost,
    this.refundSystem,
    this.depreciationPeriod,
    this.initialDeprecration,
    this.otherMessageRefund,
  );

  MethodPayment.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    profileId = json['profile_id'],
    paymentName = json['payment_name'],
    expenseMoving = json['expense_moving'],
    monthlyFees = json['monthly_fees'],
    livingRoomType = json['living_room_type'],
    area = json['area'],
    details = json['details'],
    deposit = json['deposit'],
    otherUse = json['other_use'],
    rent = json['rent'],
    adminExpense = json['admin_expense'],
    foodExpense = json['food_expense'],
    nurseCareSurcharge = json['nurse_care_surcharge'],
    otherMonthlyCost = json['other_monthly_cost'],
    refundSystem = json['refund_system'],
    depreciationPeriod = json['depreciation_period'],
    initialDeprecration = json['initial_deprecration'],
    otherMessageRefund = json['other_message_refund'];

}