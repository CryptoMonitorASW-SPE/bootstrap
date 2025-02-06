var conn = new Mongo();
var db = conn.getDB('dbsa');

db.createCollection('User', function(err, collection) {});
 
db.User.insertMany([
   {
     _id: ObjectId("67a51a89e01013ed140201fb"),
     userId: "67a51a8970a4b4c9c06fb51e",
     __v: 0,
     createdAt: ISODate("2025-02-06T20:24:41.257Z"),
     email: "a@gmail.com",
     updatedAt: ISODate("2025-02-06T20:25:28.660Z"),
     wallet: {
       id: "5kgg4gok1hj",
       transactions: [
         {
           transactionId: "43580bb6-63b3-4bd0-bed2-f3ca8ec4374b",
           cryptoId: "bitcoin",
           quantity: 1,
           type: "BUY",
           doneAt: ISODate("2025-02-06T00:00:00.000Z"),
           priceAtPurchase: 50000,
           currency: "USD"
         }
       ]
     },
     watchlist: {
       id: "pbk69q0s0da",
       items: [
         {
           itemId: "45b7b388-c142-49db-a838-3de3a05f6487",
           cryptoId: "bitcoin",
           addedAt: ISODate("2025-02-06T20:24:56.301Z")
         }
       ]
     },
     profile: {
       dateOfBirth: ISODate("2025-01-30T00:00:00.000Z"),
       name: "Nome",
       surname: "Prova"
     }
   },
   {
     _id: ObjectId("67a51a90e01013ed140201fc"),
     userId: "67a51a9070a4b4c9c06fb520",
     __v: 0,
     createdAt: ISODate("2025-02-06T20:24:48.936Z"),
     email: "b@gmail.com",
     updatedAt: ISODate("2025-02-06T20:24:48.936Z"),
     wallet: {
       id: "lh0d50wb9gd",
       transactions: []
     },
     watchlist: {
       id: "jy6pip8n4k",
       items: []
     }
   }
 ]);

db.createCollection('users', function(err, collection) {});

db.users.insertMany([
   {
     _id: ObjectId("67a51a8970a4b4c9c06fb51e"),
     email: "a@gmail.com",
     password: "$2b$12$14Lk0cI3T9JC91nx8bbGweG1L/aAfnDkJLYUkyW7K9qnW7XiF3mJ6",
     __v: 0
   },
   {
     _id: ObjectId("67a51a9070a4b4c9c06fb520"),
     email: "b@gmail.com",
     password: "$2b$12$/5vOaWKNyzhmYhr3zFU4wuSnas3wmn/ZA958dnTUAdJ6LgkNrxqXe",
     __v: 0
   }
 ]);