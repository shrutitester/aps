class BranchController{
  final delhi = BranchData(
    icon: 'Delhi.png',
    name: 'Chandni Chowk (Delhi)',
    contacts: [
      ContactPerson(
        headHeading: 'Name :',
        name: 'Rahul Kumar',
        contactNo: '9212150288',
        contact: '9510978597',
        email: 'del@anapurnasales.com',
      )
    ],
      address: Address(
          address: 'Chandni Chowk, Delhi - 110006',
      )
  );

  final kolkata = BranchData(
    icon: 'Kolkata.png',
    name: 'Kolkata',
    contacts: [
      ContactPerson(
        headHeading: 'Name :',
        name: 'Mannu Mishra',
        contactNo: '7044450288',
          contact: '7042990557',
        email: 'bb@anapurnasales.com'
      )
    ],
    address: Address(
      address: '54A, Zakaria Street 2nd Floor, Near- Mohammad Ali Park, Bada Bazar Kolkata - 700073',
    )
  );

  final ludhiana = BranchData(
    icon: 'Ludhiana.png',
    name: 'Ludhiana',
    contacts: [
      ContactPerson(
        headHeading: 'Name :',
        name: 'Chintu Kumar',
        contactNo: '8675300028',
          contact: '8675500028',
        email: 'Ldh@anapurnasales.com'
      )
    ],
    address: Address(
      address: 'House No. B-24-4833, Near SBI Bank Main Road, Sunder Nagar, Ludhiana- 141008(PB)',
    )
  );

  final ahmedabad = BranchData(
    icon: 'Ahmedabad.png',
    name: 'Ahmedabad (Gujarat)',
    contacts: [
      ContactPerson(
        headHeading: 'Name :',
        name: 'Rakesh Chawrasia',
        contactNo: '9898103387',
          contact: '8961206749',
        email: 'adi@anapurnasales.com'
      )
    ],
    address: Address(
      address: '10, Hirabhai Market, Near Safal-3, Kankaria Road, Ahmedabad- 380022 (Gujrat)',
    )
  );

  final tankroad = BranchData(
    icon: 'Delhi.png',
    name: 'Tank Road (Delhi)',
    contacts: [
      ContactPerson(
        headHeading: 'Name :',
        name: 'Raju Kumar',
        contactNo: '9871488419',
        contact: '',
        email: 'del@anapurnasales.com'
      )
    ],
    address: Address(
      address: 'Tank Road, Karol Bagh Dehli - 110005',
    )
  );

  final gandhinagar = BranchData(
    icon: 'Delhi.png',
    name: 'Delhi Gandhi Nagar (H.O.)',
    contacts: [
      ContactPerson(
        headHeading: 'Name :',
        name: 'Mr. Atul Sarraf (Director)',
        contactNo: '9212150288',
          contact:'9311150288',
        email: 'del@anapurnasales.com'
      )
    ],
    address: Address(
      address: 'IX/1563, Gali Cinema Wali, Gandhi Nagar, Delhi - 110031',
    )
  );

  final westbengal = BranchData(
    icon: 'Delhi.png',
    name: 'West Bengal',
    contacts: [
      ContactPerson(
        headHeading: 'Name :',
        name: 'Sumeet Agrawal',
        contactNo: '9163525234',
          contact: '8420497049',
        email: 'mtb@anapurnasales.com'
      )
    ],
    address: Address(
      address: 'A2-47/3, New Santoshpur, Karbala Link Road, Metiabruz, Kolkata - (W.B.) 700066',
    )
  );

  addList(){
    List<BranchData> cardList = [];
    cardList.add(gandhinagar);
    cardList.add(tankroad);
    cardList.add(delhi);
    cardList.add(kolkata);
    cardList.add(ludhiana);
    cardList.add(ahmedabad);
    cardList.add(westbengal);
    return cardList;
  }
}

class BranchData {
  String icon = '';
  String name = '';
  List<ContactPerson> contacts = [];
  Address? address;

  BranchData(
      {required this.icon,
        required this.name,
        required this.contacts,
        this.address});
}

class ContactPerson {
  String headHeading = '';
  String name = '';
  String contactNo = '';
  String contact = '';
  String email = '';

  ContactPerson(
      {required this.headHeading, required this.name, required this.contactNo, required this.email, required this.contact});
}

class Address {
  String address = '';
  // String telNo = '';
  double? latitute;
  double? longtitute;

  Address(
      {this.latitute,
        this.longtitute,
        required this.address,
        // required this.telNo
      });
}
