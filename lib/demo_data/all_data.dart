class UserInfo {
  final int id;
  final String fio;
  final String phoneNumber;
  final String avatar;
  final double rate;

  const UserInfo({
    required this.id,
    required this.fio,
    required this.phoneNumber,
    required this.avatar,
    required this.rate
  });
}

class OrderInfo {
  final int id;
  final DateTime completedTime;
  final double totalPrice;
  final double orderPrice;
  final double waitingPrice;
  final String clientName;
  final String clientAvatar;
  final double rate;
  final double distance;
  final String startedAddress;
  final String finishedAddress;
  final bool typePay;
  final bool airCooling;
  final String warning;

  const OrderInfo({
    required this.id,
    required this.completedTime,
    required this.totalPrice,
    required this.orderPrice,
    required this.waitingPrice,
    required this.clientName,
    required this.clientAvatar,
    required this.rate,
    required this.distance,
    required this.startedAddress,
    required this.finishedAddress,
    required this.typePay,
    required this.airCooling,
    required this.warning,
  });
}

class CardInfo {
  final int cardNumber;
  final double balance;
  final DateTime dueDate;
  final String phoneNumber;
  final String ownerFio;

  const CardInfo({
    required this.cardNumber,
    required this.dueDate,
    required this.balance,
    required this.phoneNumber,
    required this.ownerFio,
  });
}

class MonthlySpends {
  final DateTime month;
  final double spend;
  const MonthlySpends({
    required this.month,
    required this.spend,
});
}

List<MonthlySpends> spends = [
  MonthlySpends(month: DateTime(2024,1), spend: 7127800),
  MonthlySpends(month: DateTime(2024,2), spend: 7127800),
  MonthlySpends(month: DateTime(2024,3), spend: 7127800),
  MonthlySpends(month: DateTime(2024,4), spend: 7127800),
];

UserInfo user = const UserInfo(
  id: 1,
  fio: "Дмитрий Пономарев",
  phoneNumber: "+998935310224",
  avatar: "assets/images/avatar.jpg",
  rate: 4.97,
);

CardInfo myCard = CardInfo(
  cardNumber: 8600757765005782,
  balance: 2210650,
  dueDate: DateTime(2024, 08),
  phoneNumber: "+998 90 755 4554",
  ownerFio: "Ponomarev Dmitriy",
);

List<OrderInfo> orders = [
  OrderInfo(
    id: 1,
    completedTime: DateTime(2024, 04, 30, 12, 53),
    totalPrice: 21500,
    orderPrice: 17500,
    waitingPrice: 4000,
    clientName: "Милана",
    clientAvatar: "assets/images/client.jpg",
    rate: 4.97,
    distance: 2.2,
    startedAddress: "Махтумкули, 79",
    finishedAddress: "Махтумкули, 117",
    typePay: false,
    airCooling: true,
    warning:
        "Поедет моя мама, просит не торопиться,  так как очень боится скорости",
  ),
  OrderInfo(
    id: 2,
    completedTime: DateTime(2024, 04, 30, 08, 45),
    totalPrice: 54000,
    orderPrice: 50000,
    waitingPrice: 4000,
    clientName: "Майкл",
    clientAvatar: "assets/images/client2.jpg",
    rate: 4.85,
    distance: 6.3,
    startedAddress: "Махтумкули, 117",
    finishedAddress: "Олмазор, 23А",
    typePay: true,
    airCooling: true,
    warning: "Мне нужно идти быстрее, я спешу",
  ),
];
