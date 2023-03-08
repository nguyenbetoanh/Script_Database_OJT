create database BLOG_BOOK_01;
use BLOG_BOOK_01;
create table Category
(
    CatalogId int primary key auto_increment ,
    CatalogName nvarchar(100),
    CatalogStatus bit
);
create table Contact
(
    ContactId int primary key auto_increment,
    Address   text,
    Email     nvarchar(50),
    Phone     nvarchar(50)
);
create table Book
(
    BookId          int primary key auto_increment,
    BookName        nvarchar(100),
    Descriptions    text,
    BookTitle       nvarchar(100),
    ISBN            text,
    EditionLanguage nvarchar(50),
    DatePublished   date,
    Publisher       nvarchar(100),
    ImportPrice     float,
    ExportPrice     float,
    Quantity        int,
    Sale            int,
    BookStatus      bit,
    CatalogId int ,
    AuthorId int,
    FOREIGN KEY (CatalogId) references Category(CatalogId),
    FOREIGN KEY (AuthorId) references  Author(AuthorId)
);
create table Author
(
    AuthorId int primary key auto_increment,
    AuthorName nvarchar(50)

);
create table Tag
(
    TagId     int primary key auto_increment,
    TagName   nvarchar(50),
    TagStatus bit
);
create table TagBooks(
    TagBooksId int primary key auto_increment,
    TagId int,
    BookId int,
    FOREIGN KEY (TagId) references Tag(TagId),
    FOREIGN KEY (BookId) references Book(BookId)
);
create table OrderDetail
(
    OrderDetailId int primary key auto_increment,
    Quantity      int,
    Price         float,
    StatusDetail  bit,
    BookId int ,
    OrderId int,
    FOREIGN KEY (BookId) references Book(BookId),
    FOREIGN KEY (OrderId) references Orders(OrderId)
);
create table Orders
(
    OrderId     int  primary key auto_increment,
    TotalMoney  float,
    Discount    int,
    Address     text,
    State       text,
    City        text,
    Post        text,
    Phone       nvarchar(10),
    FirstName   nvarchar(50),
    LastName    nvarchar(50),
    note        text,
    Email       nvarchar(100),
    CreateDate  date,
    StatusOrder int,
    UserId int,
    FOREIGN KEY (UserId) references Users(UserId)
);
create table Users
(
    UserId     int primary key auto_increment,
    FirstName  nvarchar(50),
    LastName   nvarchar(50),
    Email      nvarchar(100),
    Passwords  nvarchar(20),
    Address    text,
    State      text,
    City       text,
    Post       text,
    Phone      nvarchar(10),
    Avatar     text,
    BirtDate   date,
    StatusUser bit,
    Ranks      int,
    Roles      bit
);
create table Likes
(
    LikeId int primary key auto_increment,
    BookId int,
    UserId int,
    FOREIGN KEY (UserId) references Users(UserId),
    FOREIGN KEY (BookId) references Book(BookId)
);
create table Star
(
    StarId int primary key auto_increment,
    BookId int,
    UserId int,
    FOREIGN KEY (UserId) references Users(UserId),
    FOREIGN KEY (BookId) references Book(BookId)
);
create table WishList
(
    WishListId     int primary key auto_increment,
    StatusWishlist int,
    BookId int,
    UserId int,
    FOREIGN KEY (UserId) references Users(UserId),
    FOREIGN KEY (BookId) references Book(BookId)
);
create table Comment
(
    CommentId     int primary key auto_increment,
    StatusComment int,
    BookId int,
    UserId int,
    Contexts text,
    FOREIGN KEY (UserId) references Users(UserId),
    FOREIGN KEY (BookId) references Book(BookId)
);


