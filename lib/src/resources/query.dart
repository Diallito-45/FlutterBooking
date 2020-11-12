class QueryMutation {

  String signUpUser(String email, String password) {
    return """
        mutation {
            signup(email: "$email", password: "$password"){
              id
              email
            }
          }
    """;
  }

  String signInUser(String email, String password) {
    return """
      query {
        login(email: "$email", password: "$password") {
          jwt
          }
        }
    """;
  }

  // ignore: non_constant_identifier_names
  String hotelsearch(String city, String startDate,
    // ignore: non_constant_identifier_names
    String endDate, int max_occupancy, int room_number
          ) {
  return """
query{
  findhotel(city: $city, startDate : $startDate, 
  endDate:$endDate, max_occupancy:$max_occupancy, room_number:$room_number
  ){
    id
    name
    contact
    city{
      id
      name
    }
    location
    parking
    breakfast
    option
    imageList_Url
    imageUrl
    price
    rating
    isfavoris
    createdAt
      }
    }
  """;
}

  // ignore: non_constant_identifier_names
  String bookRomms(List<String> romsid, String from, String to) {
  return """
mutation{
  bookNow(bookingInput:{roomsid: [$romsid], reserved: { from: $from, to: $to}
  }) {
    _id
    roomsbooked{
      name
      room_number
      max_occupancy
      reserved{
        from
        to
      }
      hotel{
        id
        name
        city{
          name
        }
      }
    }
    reserved{
      from
      to
    }
  }
}
  """;
}
    // ignore: non_constant_identifier_names
  String findavailableromms(String hotel_id, String startDate,
    // ignore: non_constant_identifier_names
    String endDate, int max_occupancy, int room_number
  ) {
  return """
query{ 
findavailablerooms(hotel_id: $hotel_id, startDate: $startDate,
  endDate: $endDate, room_number: $room_number, max_occupancy: $max_occupancy){
  name
  id
  room_number
  max_occupancy
  reserved{
    from
    to
  }
}
}
  """;
}

  String findhotelbyId(String hotelid) {
    return """
        query{
          hotel(hotelId:"$hotelid"){
            id
            name
            contact
            location
            parking
            option
            imageUrl
            price
            rating
            isfavoris
            createdAt
        }
      }
    """;
  }

  String searche(String term) {
    return """
      query{
        search(term: "$term"){
        id
        name
        contry
        user{
          id
          name
          email
        }
      }
    }
    """;
  }

  String addPerson(String id, String name, String lastName, int age) {
    return """
      mutation{
          addPerson(id: "$id", name: "$name", lastName: "$lastName", age: $age){
            id
            name
            lastName
            age
          }
      }
    """;
  }

  String getcurrentUser() {
    return """ 
      query{
          user{
            email
        }
      }
    """;
  }

  String getAll() {
    return """ 
      {
        persons{
          id
          name
          lastName
          age
        }
      }
    """;
  }

  String deletePerson(String id) {
    return """
      mutation{
        deletePerson(id: "$id"){
          id
        }
      } 
    """;
  }

  String editPerson(String id, String name, String lastName, int age) {
    return """
      mutation{
          editPerson(id: "$id", name: "$name", lastName: "$lastName", age: $age){
            name
            lastName
          }
      }    
    """;
  }
}
