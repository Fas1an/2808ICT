/*----------Welcome to Remarkable University----------*/


DROP SCHEMA IF EXISTS assignment2_121;
CREATE DATABASE IF NOT EXISTS assignment2_121;
USE assignment2_121;

/*----------Create Tables----------*/
CREATE TABLE tbl_address (
  id_address varchar(50)  NOT NULL PRIMARY KEY,
  street_name varchar(50)  NOT NULL,
  street_type varchar(20)  NOT NULL,
  suburb varchar(50)  NOT NULL,
  postcode varchar(8)  NOT NULL,
  longitude float(10,6) NOT NULL,
  latitude float(10,6) NOT NULL
);

CREATE TABLE tbl_courses (
  id_course varchar(50)  NOT NULL PRIMARY KEY,
  id_degree varchar(50)  NOT NULL,
  id_staff varchar(50)  NOT NULL,
  entry_req varchar(100)  NOT NULL,
  full_time_duration varchar(20)  NOT NULL,
  part_time_duration varchar(20)  NOT NULL,
  credit_points int(11) NOT NULL,
  domestic_fee double NOT NULL,
  international_fee double NOT NULL,
  campus varchar(50)  NOT NULL,
  name varchar(100)  NOT NULL
);

CREATE TABLE tbl_degrees (
  id_degree varchar(50)  NOT NULL PRIMARY KEY,
  id_staff varchar(50)  NOT NULL,
  name varchar(100)  NOT NULL,
  entry_req varchar(100)  NOT NULL,
  full_time_duration varchar(20)  NOT NULL,
  part_time_duration varchar(20)  NOT NULL,
  credit_points int(11) NOT NULL,
  domestic_fee double NOT NULL,
  international_fee double NOT NULL,
  campus varchar(50)  NOT NULL
);

CREATE TABLE tbl_degree_enrolled (
  id_enroll varchar(50)  NOT NULL PRIMARY KEY,
  id_student varchar(50)  NOT NULL,
  id_degree varchar(50)  NOT NULL,
  start_date date NOT NULL,
  est_finish_date date NOT NULL
);

CREATE TABLE tbl_person_details (
  id_person varchar(50)  NOT NULL PRIMARY KEY,
  id_address varchar(50)  NOT NULL,
  first_name varchar(50)  NOT NULL,
  last_name varchar(50)  NOT NULL,
  DOB date NOT NULL,
  home_phone varchar(50)  NOT NULL,
  mobile_phone varchar(10)  NOT NULL,
  emergency_phone varchar(50)  NOT NULL,
  street_number int(11) NOT NULL,
  unit_number int(11) NOT NULL,
  address_prefix varchar(10)  NOT NULL,
  notes text  NOT NULL,
  middle_name varchar(50)  NOT NULL,
  gender varchar(20)  NOT NULL
);


CREATE TABLE tbl_staff (
  id_staff varchar(50)  NOT NULL PRIMARY KEY,
  id_person varchar(50)  NOT NULL,
  position varchar(50)  NOT NULL,
  work_type varchar(50)  NOT NULL,
  hourly_rate double NOT NULL,
  reports_to varchar(50)  NOT NULL,
  duty varchar(50)  NOT NULL
);

CREATE TABLE tbl_student (
  id_student varchar(50)  NOT NULL PRIMARY KEY,
  id_person varchar(50)  NOT NULL
);

CREATE TABLE tbl_student_enrolled (
  id_student_enrolled varchar(50)  NOT NULL PRIMARY KEY,
  id_course varchar(50)  NOT NULL,
  current_grade decimal(10,0) NOT NULL,
  enrolled_status varchar(50)  NOT NULL,
  credit_points int(11) NOT NULL,
  domestic_fee double NOT NULL,
  international_fee double NOT NULL,
  campus varchar(50)  NOT NULL,
  id_student varchar(50)  NOT NULL
);

/*----------Finished Create Tables----------*/


/*----------not random address data----------*/
/*which is grabbed, filtered and cleaned by me*/
/*from Australian goverment data.gov.au*/
/*https://data.gov.au/dataset/ds-dga-19432f89-dc3a-4ef3-b943-5326ef1dbecc/details?q=G-NAF*/

INSERT INTO tbl_address (id_address, street_name, street_type, suburb, postcode, longitude, latitude) VALUES
('QLD135938', 'THE LINKS', '', 'ROBINA', '4226', '153.408815', '-28.0773105'),
('QLD136346', 'FRANKLIN', 'STREET',  'ROCKLEA', '4106', '153.007640', '-27.5469584'),
('QLD136676', 'MYKA', 'COURT',  'ROCKY POINT', '4874', '141.877410', '-12.6257115'),
('QLD137415', 'CLAYTON', 'ROAD',  'ROSSLYN', '4703', '150.775685', '-23.1786370'),
('QLD137533', 'JUSTINS', 'COURT', 'ROTHWELL', '4022', '153.059728', '-27.2148980'),
('QLD137623', 'MAROSKE', 'ROAD',  'ROYSTON', '4515', '152.663514', '-26.9163624'),
('QLD137746', 'WEWAK', 'AVENUE',  'RUNAWAY BAY', '4216', '153.403182', '-27.9053789'),
('QLD137815', 'EASTMERE', 'STREET',  'RUNCORN', '4113', '153.083754', '-27.5927233'),
('QLD137823', 'ESPERANCE', 'STREET',  'RUNCORN', '4113', '153.063253', '-27.6104925'),
('QLD138069', 'LANCASTER', 'ROAD', 'RUNNING CREEK', '4287', '152.976193', '-28.3204315'),
('QLD138088', 'SCOTTS', 'LANE',  'RUNNYMEDE', '4615', '152.090097', '-26.5337538'),
('QLD138188', 'ARNOLD', 'STREET',  'RUSSELL ISLAND', '4184', '153.373646', '-27.6962966'),
('QLD138496', 'NAKEN', 'PLACE',  'RUSSELL ISLAND', '4184', '153.376300', '-27.6917834'),
('QLD138675', 'WYLIE', 'STREET',  'RUSSELL ISLAND', '4184', '153.383089', '-27.6510576'),
('QLD138704', 'SEEFELD', 'ROAD',  'RYEFORD', '4361', '151.799817', '-27.9293669'),
('QLD138765', 'ALTHEA', 'STREET',  'SALISBURY', '4107', '153.047134', '-27.5561337'),
('QLD139066', 'SEVENTH', 'AVENUE',  'SANDGATE', '4017', '153.068540', '-27.3155807'),
('QLD140552', 'MCDOUGALL', 'CLOSE',  'SILKSTONE', '4304', '152.789252', '-27.6270025'),
('QLD140921', 'SANDLEIGH', 'CRESCENT',  'SIPPY DOWNS', '4556', '153.069867', '-26.7262155'),
('QLD140357', 'OLEANDER', 'AVENUE',  'SHELLY BEACH', '4551', '153.144548', '-26.7959800'),
('QLD141206', 'AMAROO', 'CLOSE',  'SMITHFIELD', '4878', '145.688618', '-16.8304295'),
('QLD140446', 'CONE', 'STREET',  'SHOAL POINT', '4750', '149.154383', '-21.0039266'),
('QLD141489', 'QUEENS', 'ESPLANADE',  'BIRKDALE', '4159', '153.211885', '-27.4827455'),
('QLD142006', 'CREDLIN', 'STREET',  'SOUTH MACKAY', '4740', '149.190102', '-21.1654987'),
('QLD142018', 'FORTH', 'STREET',  'SOUTH MACKAY', '4740', '149.181149', '-21.1528098'),
('QLD142273', 'MERRYL', 'STREET',  'SOUTH TOOWOOMBA', '4350', '151.948672', '-27.5832707'),
('QLD142769', 'VIRGINIA', 'GROVE',  'SOUTHPORT', '4215', '153.401428', '-27.9787250'),
('QLD134854', 'GREYGUM', 'COURT',  'REGENTS PARK', '4118', '153.048783', '-27.6796603'),
('QLD109176', 'CANTON', 'COURT',  'MANLY WEST', '4179', '153.165864', '-27.4748054'),
('QLD109204', 'GABRIELLE', 'PLACE',  'MANLY WEST', '4179', '153.156381', '-27.4722216'),
('QLD109291', 'TARONGO', 'STREET',  'MANLY WEST', '4179', '153.166023', '-27.4656871'),
('QLD109369', 'YAMBOYNA', 'STREET', 'MANLY', '4179', '153.182209', '-27.4570686');


/*----------Random person data----------*/

INSERT INTO tbl_person_details (id_person,id_address,first_name,middle_name,last_name,gender,DOB,home_phone,mobile_phone,emergency_phone,street_number,unit_number,address_prefix,notes)VALUES ('MKzkLuwnEQNtU40OxSnistrsDzH8IOUl8eUlHEOpahCHZCDkza','QLD136676','kye','kye','bob','male','2020-09-01','8483605839','2792755809','8181843068','1','2','','');
INSERT INTO tbl_person_details (id_person,id_address,first_name,middle_name,last_name,gender,DOB,home_phone,mobile_phone,emergency_phone,street_number,unit_number,address_prefix,notes)VALUES ('sHHrVJ7xHBDlhrpUxkEi3MsGAfFf1kyofCRwh6oFisiUNMXNVT','QLD136346','helena','ash','jasmine','female','2020-09-01','7104737800','4735795426','6952656577','18','16','','');
INSERT INTO tbl_person_details (id_person,id_address,first_name,middle_name,last_name,gender,DOB,home_phone,mobile_phone,emergency_phone,street_number,unit_number,address_prefix,notes)VALUES ('JhDGIOeYlwZjPTi8RMcaxlgvLcSZy5MgzZTLUGsmq75hONyflH','QLD109291','kye','shannon','phoebe','male','2020-09-01','8743783299','2216040167','7969514420','2','21','','');
INSERT INTO tbl_person_details (id_person,id_address,first_name,middle_name,last_name,gender,DOB,home_phone,mobile_phone,emergency_phone,street_number,unit_number,address_prefix,notes)VALUES ('rJuXXjdIlMbuSlNRGfV7QRpx4Nqms1bHYCgywaoVjFD7OlsZLU','QLD134854','ash','kye','bob','female','2020-09-01','1393813551','1963938671','3497520811','14','14','','');
INSERT INTO tbl_person_details (id_person,id_address,first_name,middle_name,last_name,gender,DOB,home_phone,mobile_phone,emergency_phone,street_number,unit_number,address_prefix,notes)VALUES ('KBXYzYXLuXFikfAGQT1n3GNtpKNghWsJJghymcybuyj1nUxKC3','QLD109291','phoebe','ash','helena','female','2020-09-01','3348762595','1339519081','5912929375','20','14','','');
INSERT INTO tbl_person_details (id_person,id_address,first_name,middle_name,last_name,gender,DOB,home_phone,mobile_phone,emergency_phone,street_number,unit_number,address_prefix,notes)VALUES ('9nQHCOFDhJVdNfBo4GwRADJW3TqxPtrCb2urhgTZgxecxJgNvf','QLD109291','kye','emmie','bob','female','2020-09-01','8018246453','6517340058','8855682486','27','25','','');
INSERT INTO tbl_person_details (id_person,id_address,first_name,middle_name,last_name,gender,DOB,home_phone,mobile_phone,emergency_phone,street_number,unit_number,address_prefix,notes)VALUES ('rEtXITEtfCQaqoLwG6ZMMDpmxdMcppAaGTppo1iBMGBP5aVmz9','QLD135938','helena','jasmine','jack','male','2020-09-01','5799376955','2581002078','3702851334','21','22','','');
INSERT INTO tbl_person_details (id_person,id_address,first_name,middle_name,last_name,gender,DOB,home_phone,mobile_phone,emergency_phone,street_number,unit_number,address_prefix,notes)VALUES ('Tn460YVtyYLwkZlsAIPkBuFRiMwPheGyqMOJgMytwh2orGFCiA','QLD136346','shannon','phoebe','john','male','2020-09-01','7425784938','7534326250','4141769187','17','23','','');
INSERT INTO tbl_person_details (id_person,id_address,first_name,middle_name,last_name,gender,DOB,home_phone,mobile_phone,emergency_phone,street_number,unit_number,address_prefix,notes)VALUES ('Q7IzJWMSgmwCMMtPxvwVpuQXFrIP4kZUFXegChehBljc3X6fbh','QLD134854','darcie','darcie','ash','male','2020-09-01','3661986294','7886315258','1446214504','10','12','','');
INSERT INTO tbl_person_details (id_person,id_address,first_name,middle_name,last_name,gender,DOB,home_phone,mobile_phone,emergency_phone,street_number,unit_number,address_prefix,notes)VALUES ('gQeyYXFlDjDseBumLa9pKVzzkYopNsDu3T4MU6MSVpGTdzdYXz','QLD109204','mark','molly','helena','male','2020-09-01','9200824034','9524912791','9818699205','2','24','','');
/*----------Random staff data----------*/

INSERT INTO tbl_person_details (id_person,id_address,first_name,middle_name,last_name,gender,DOB,home_phone,mobile_phone,emergency_phone,street_number,unit_number,address_prefix,notes)VALUES ('XgrjaFnvU5RH4qgewM5txAXxyVaZnPmWVUrkoQIMpHUFFZoH4e','QLD137415','bob','darcie','emmie','female','2020-09-01','4240220058','7912463256','7862244395','24','29','','');
INSERT INTO tbl_staff (id_staff,id_person,position,work_type,hourly_rate,reports_to,duty)VALUES ('gOEECeyr4aZko6zbQEFLTvzNhvKgXeIn8PjcWIg4zKKTLMRtkf','XgrjaFnvU5RH4qgewM5txAXxyVaZnPmWVUrkoQIMpHUFFZoH4e','random','fulltime','28','++','random');
INSERT INTO tbl_person_details (id_person,id_address,first_name,middle_name,last_name,gender,DOB,home_phone,mobile_phone,emergency_phone,street_number,unit_number,address_prefix,notes)VALUES ('rPusT2arcWlT7VDFbZHWaziVHMokJLgGFrDO6lvjrarXPL5ujJ','QLD136676','john','kye','darcie','male','2020-09-01','6282201817','9407366882','8821017528','9','24','','');
INSERT INTO tbl_staff (id_staff,id_person,position,work_type,hourly_rate,reports_to,duty)VALUES ('VhdWV78dZIqlKWcHAuyxFVKSnGYxkwwVSJmwioOHk0zFhDaHl7','rPusT2arcWlT7VDFbZHWaziVHMokJLgGFrDO6lvjrarXPL5ujJ','random','casual','96','+XgrjaFnvU5RH4qgewM5txAXxyVaZnPmWVUrkoQIMpHUFFZoH4e+','random');
INSERT INTO tbl_person_details (id_person,id_address,first_name,middle_name,last_name,gender,DOB,home_phone,mobile_phone,emergency_phone,street_number,unit_number,address_prefix,notes)VALUES ('gjZvHTzu1Bqn7AxqqFJNTNFTXK4KkAg3FRkLbGsQivaaTteiLp','QLD136676','darcie','phoebe','jack','female','2020-09-01','7654646724','3668657442','9220987220','8','28','','');
INSERT INTO tbl_staff (id_staff,id_person,position,work_type,hourly_rate,reports_to,duty)VALUES ('edW9udGXYnucifGVqjINGmnk6dBYvASVGxa5iySTBStFhsU1GM','gjZvHTzu1Bqn7AxqqFJNTNFTXK4KkAg3FRkLbGsQivaaTteiLp','random','partime','99','+XgrjaFnvU5RH4qgewM5txAXxyVaZnPmWVUrkoQIMpHUFFZoH4e+','random');
INSERT INTO tbl_person_details (id_person,id_address,first_name,middle_name,last_name,gender,DOB,home_phone,mobile_phone,emergency_phone,street_number,unit_number,address_prefix,notes)VALUES ('PSPWHXJxekUrqqXKW9mYsfvPX2fhhLhcoW4CsGx4xTBHXGonxg','QLD135938','ash','john','darcie','female','2020-09-01','6543054440','3694808981','3883741812','26','11','','');
INSERT INTO tbl_staff (id_staff,id_person,position,work_type,hourly_rate,reports_to,duty)VALUES ('iqONz2yE4EavFlBqFOLmRYqUpkxQEFitQjHy1klocLAkUP9CiD','PSPWHXJxekUrqqXKW9mYsfvPX2fhhLhcoW4CsGx4xTBHXGonxg','random','partime','62','+XgrjaFnvU5RH4qgewM5txAXxyVaZnPmWVUrkoQIMpHUFFZoH4e+','random');
INSERT INTO tbl_person_details (id_person,id_address,first_name,middle_name,last_name,gender,DOB,home_phone,mobile_phone,emergency_phone,street_number,unit_number,address_prefix,notes)VALUES ('vVgwmN6E6iPBXVHjbEDyKoyUNyOkZtGkqfY9gIeTM4TqabtMtT','QLD109291','kye','emmie','jasmine','female','2020-09-01','7783752500','6083731508','6042636584','30','24','','');
INSERT INTO tbl_staff (id_staff,id_person,position,work_type,hourly_rate,reports_to,duty)VALUES ('xMP6yMPTyaorh7mhrBWop0KKVsJKIa8CwIUYZSTgTCeHvgeqgc','vVgwmN6E6iPBXVHjbEDyKoyUNyOkZtGkqfY9gIeTM4TqabtMtT','random','fulltime','31','+XgrjaFnvU5RH4qgewM5txAXxyVaZnPmWVUrkoQIMpHUFFZoH4e+','random');
INSERT INTO tbl_person_details (id_person,id_address,first_name,middle_name,last_name,gender,DOB,home_phone,mobile_phone,emergency_phone,street_number,unit_number,address_prefix,notes)VALUES ('RUsngwVacnyIIfmy5VrVEXjbFRPR5CuGsRZ7F6AmGsmqpfYnCY','QLD135938','jack','shannon','emmie','female','2020-09-01','4893448997','1569222068','9777153000','4','3','','');
INSERT INTO tbl_staff (id_staff,id_person,position,work_type,hourly_rate,reports_to,duty)VALUES ('gs8HUTjiovFjSZntwnvHWFNJnGt8iCHx5rfRmWXExXXU2OvmdP','RUsngwVacnyIIfmy5VrVEXjbFRPR5CuGsRZ7F6AmGsmqpfYnCY','random','partime','32','+XgrjaFnvU5RH4qgewM5txAXxyVaZnPmWVUrkoQIMpHUFFZoH4e+','random');
INSERT INTO tbl_person_details (id_person,id_address,first_name,middle_name,last_name,gender,DOB,home_phone,mobile_phone,emergency_phone,street_number,unit_number,address_prefix,notes)VALUES ('2QhuhAJhPapf9JKirjauEztYRoHpb1az3ZErBZDExQnROCjQFZ','QLD134854','helena','emmie','jack','female','2020-09-01','4827461971','3716267702','3181146278','3','27','','');
INSERT INTO tbl_staff (id_staff,id_person,position,work_type,hourly_rate,reports_to,duty)VALUES ('uhGJepKbosp1RmEfiRrFGXNwPiDHbaKA35AHgFOnTdMUGiumd0','2QhuhAJhPapf9JKirjauEztYRoHpb1az3ZErBZDExQnROCjQFZ','random','casual','49','+XgrjaFnvU5RH4qgewM5txAXxyVaZnPmWVUrkoQIMpHUFFZoH4e+','random');
INSERT INTO tbl_person_details (id_person,id_address,first_name,middle_name,last_name,gender,DOB,home_phone,mobile_phone,emergency_phone,street_number,unit_number,address_prefix,notes)VALUES ('YlGIpZhCeNKfOzgL59LlCYvmHofjmKEPLPNBio1egnH6ecuEQv','QLD136346','shannon','jack','jasmine','female','2020-09-01','2274838454','8109489385','6413801067','25','9','','');
INSERT INTO tbl_staff (id_staff,id_person,position,work_type,hourly_rate,reports_to,duty)VALUES ('JnDPTso6OQmjfAfkAyxOM11axUTFBHqh7NhDFGGohoYpyPDoiv','YlGIpZhCeNKfOzgL59LlCYvmHofjmKEPLPNBio1egnH6ecuEQv','random','fulltime','64','+XgrjaFnvU5RH4qgewM5txAXxyVaZnPmWVUrkoQIMpHUFFZoH4e+','random');
INSERT INTO tbl_person_details (id_person,id_address,first_name,middle_name,last_name,gender,DOB,home_phone,mobile_phone,emergency_phone,street_number,unit_number,address_prefix,notes)VALUES ('eFtwpcboGBpASCHXozkPV6mIEu4mftY6cnPJoGXDjpXCVoy1ZR','QLD137533','shannon','jasmine','phoebe','female','2020-09-01','7376448424','4112599822','8873876072','24','7','','');
INSERT INTO tbl_staff (id_staff,id_person,position,work_type,hourly_rate,reports_to,duty)VALUES ('gJqXJAPcuAfrkXynOUSrUizW8fNtZEmDaaSW6w8lvyJrfJAGJ3','eFtwpcboGBpASCHXozkPV6mIEu4mftY6cnPJoGXDjpXCVoy1ZR','random','casual','47','+XgrjaFnvU5RH4qgewM5txAXxyVaZnPmWVUrkoQIMpHUFFZoH4e+','random');
INSERT INTO tbl_person_details (id_person,id_address,first_name,middle_name,last_name,gender,DOB,home_phone,mobile_phone,emergency_phone,street_number,unit_number,address_prefix,notes)VALUES ('wHRM64oYGUdwzFlvjieXFGLiHLDEvnLmkpaGccIu8G0BxlqUTF','QLD137415','john','shannon','jack','male','2020-09-01','6160413491','9085489904','4028742318','14','0','','');
INSERT INTO tbl_staff (id_staff,id_person,position,work_type,hourly_rate,reports_to,duty)VALUES ('vsEeXLmaZjQqaZNIxcNiQDuFBfxX0cnHAf2FOYxdoaD8B9DRmr','wHRM64oYGUdwzFlvjieXFGLiHLDEvnLmkpaGccIu8G0BxlqUTF','random','casual','21','+XgrjaFnvU5RH4qgewM5txAXxyVaZnPmWVUrkoQIMpHUFFZoH4e+','random');
/*----------Random degrees data----------*/

INSERT INTO tbl_degrees (id_degree,id_staff,name,entry_req,full_time_duration,part_time_duration,credit_points,domestic_fee,international_fee,campus)VALUES ('7BpYRffuQnoWISkJGRFsUibZ8XrVwMZnLEnxAe5Vh8mzVavsiH','gOEECeyr4aZko6zbQEFLTvzNhvKgXeIn8PjcWIg4zKKTLMRtkf','Bachelor of Acting','not much','long time','long time with breaks',240,30000,50000,'nathan');
INSERT INTO tbl_degrees (id_degree,id_staff,name,entry_req,full_time_duration,part_time_duration,credit_points,domestic_fee,international_fee,campus)VALUES ('xOd6jjrYGnKBcPNBTXJ2hYfFbviKs0K6CRPwYyaXndpwDMzaPj','VhdWV78dZIqlKWcHAuyxFVKSnGYxkwwVSJmwioOHk0zFhDaHl7','Bachelor of Animation','not much','long time','long time with breaks',240,30000,50000,'nathan');
INSERT INTO tbl_degrees (id_degree,id_staff,name,entry_req,full_time_duration,part_time_duration,credit_points,domestic_fee,international_fee,campus)VALUES ('G7xUPoHjrpWtdGRko7pcDTRxbAzHTboaklNFQ8iHbNHOkvA6JM','edW9udGXYnucifGVqjINGmnk6dBYvASVGxa5iySTBStFhsU1GM','Bachelor of Arts','not much','long time','long time with breaks',240,30000,50000,'nathan');
INSERT INTO tbl_degrees (id_degree,id_staff,name,entry_req,full_time_duration,part_time_duration,credit_points,domestic_fee,international_fee,campus)VALUES ('WNJ9hpqSRFACiYOgP2CoihNUuFVAHiIopkgcsP8w8zAtjKMcbh','iqONz2yE4EavFlBqFOLmRYqUpkxQEFitQjHy1klocLAkUP9CiD','Bachelor of IT','not much','long time','long time with breaks',240,30000,50000,'nathan');
INSERT INTO tbl_degrees (id_degree,id_staff,name,entry_req,full_time_duration,part_time_duration,credit_points,domestic_fee,international_fee,campus)VALUES ('NwrrFcQWklkMMr2WpyraUDa2AmUxoHKhoOux03GUBiJGLviFXX','xMP6yMPTyaorh7mhrBWop0KKVsJKIa8CwIUYZSTgTCeHvgeqgc','Bachelor of Business','not much','long time','long time with breaks',240,30000,50000,'nathan');
INSERT INTO tbl_degrees (id_degree,id_staff,name,entry_req,full_time_duration,part_time_duration,credit_points,domestic_fee,international_fee,campus)VALUES ('PygqLlWbBaHsoCBUNBFZK8CLbWspqbfAd1LAsVe3TlB4ncgQbo','gs8HUTjiovFjSZntwnvHWFNJnGt8iCHx5rfRmWXExXXU2OvmdP','Bachelor of Commerce','not much','long time','long time with breaks',240,30000,50000,'nathan');
INSERT INTO tbl_degrees (id_degree,id_staff,name,entry_req,full_time_duration,part_time_duration,credit_points,domestic_fee,international_fee,campus)VALUES ('CjE7bK9wzXHyXaOafTU5filyPmJRlFNArMtjVYTHuy9VojtMuC','uhGJepKbosp1RmEfiRrFGXNwPiDHbaKA35AHgFOnTdMUGiumd0','Bachelor of Dental','not much','long time','long time with breaks',240,30000,50000,'nathan');
INSERT INTO tbl_degrees (id_degree,id_staff,name,entry_req,full_time_duration,part_time_duration,credit_points,domestic_fee,international_fee,campus)VALUES ('w6ofDbgQyQ4V3PQMacqA4brMdkGFBkIBMxxhJAopgwUPHQCJuu','JnDPTso6OQmjfAfkAyxOM11axUTFBHqh7NhDFGGohoYpyPDoiv','Bachelor of Crimonology','not much','long time','long time with breaks',240,30000,50000,'nathan');
INSERT INTO tbl_degrees (id_degree,id_staff,name,entry_req,full_time_duration,part_time_duration,credit_points,domestic_fee,international_fee,campus)VALUES ('ADcbKizUtA9zqRWrXMwcABh0HTtyCSwHmvNLzUnVNkj8tAeBj1','gJqXJAPcuAfrkXynOUSrUizW8fNtZEmDaaSW6w8lvyJrfJAGJ3','Bachelor of Design','not much','long time','long time with breaks',240,30000,50000,'nathan');
/*----------Random courses data----------*/

INSERT INTO tbl_courses (id_course,id_degree,id_staff,name,entry_req,full_time_duration,part_time_duration,credit_points,domestic_fee,international_fee,campus)VALUES ('ECmyXZYkBXjWwldedwWzmRHq2DwLmoGjJWX1oP4qAHa4nduDDX','7BpYRffuQnoWISkJGRFsUibZ8XrVwMZnLEnxAe5Vh8mzVavsiH','gOEECeyr4aZko6zbQEFLTvzNhvKgXeIn8PjcWIg4zKKTLMRtkf','6971ICT','not much','long time','long time with breaks',240,3000,5000,'nathan');
INSERT INTO tbl_courses (id_course,id_degree,id_staff,name,entry_req,full_time_duration,part_time_duration,credit_points,domestic_fee,international_fee,campus)VALUES ('vnjgx9HAhaCZQ1QgEtkpTRrXgJMo1qXyWjZ9rQUCRoJClLmhFo','xOd6jjrYGnKBcPNBTXJ2hYfFbviKs0K6CRPwYyaXndpwDMzaPj','VhdWV78dZIqlKWcHAuyxFVKSnGYxkwwVSJmwioOHk0zFhDaHl7','8118ICT','not much','long time','long time with breaks',240,3000,5000,'nathan');
INSERT INTO tbl_courses (id_course,id_degree,id_staff,name,entry_req,full_time_duration,part_time_duration,credit_points,domestic_fee,international_fee,campus)VALUES ('BtbkKqfIIGv0EykaDXl5PKk7ubESmhlHYnTwELf9KHZrBuNImg','G7xUPoHjrpWtdGRko7pcDTRxbAzHTboaklNFQ8iHbNHOkvA6JM','edW9udGXYnucifGVqjINGmnk6dBYvASVGxa5iySTBStFhsU1GM','1658ICT','not much','long time','long time with breaks',240,3000,5000,'nathan');
INSERT INTO tbl_courses (id_course,id_degree,id_staff,name,entry_req,full_time_duration,part_time_duration,credit_points,domestic_fee,international_fee,campus)VALUES ('wzJUErdK0ETuq3GBOUUJGlyir43URWFnMvpxCwexYsLeylmiTN','WNJ9hpqSRFACiYOgP2CoihNUuFVAHiIopkgcsP8w8zAtjKMcbh','iqONz2yE4EavFlBqFOLmRYqUpkxQEFitQjHy1klocLAkUP9CiD','2616ICT','not much','long time','long time with breaks',240,3000,5000,'nathan');
INSERT INTO tbl_courses (id_course,id_degree,id_staff,name,entry_req,full_time_duration,part_time_duration,credit_points,domestic_fee,international_fee,campus)VALUES ('mCfEsBEtSH4SJlpdmJLNYZDabKSZcdECvwNc8qHkxetQ1wjaY0','NwrrFcQWklkMMr2WpyraUDa2AmUxoHKhoOux03GUBiJGLviFXX','xMP6yMPTyaorh7mhrBWop0KKVsJKIa8CwIUYZSTgTCeHvgeqgc','8906ICT','not much','long time','long time with breaks',240,3000,5000,'nathan');
INSERT INTO tbl_courses (id_course,id_degree,id_staff,name,entry_req,full_time_duration,part_time_duration,credit_points,domestic_fee,international_fee,campus)VALUES ('vaNBArNZNFShCHR6jdGd5E2jjiOewJtXVbVpdeBl1XimENBamg','PygqLlWbBaHsoCBUNBFZK8CLbWspqbfAd1LAsVe3TlB4ncgQbo','gs8HUTjiovFjSZntwnvHWFNJnGt8iCHx5rfRmWXExXXU2OvmdP','3433ICT','not much','long time','long time with breaks',240,3000,5000,'nathan');
INSERT INTO tbl_courses (id_course,id_degree,id_staff,name,entry_req,full_time_duration,part_time_duration,credit_points,domestic_fee,international_fee,campus)VALUES ('jiXF9EOvKTBfvvhMUoWbBtb3ESPqnsP3eDoARdWnZOfqR0ggGd','CjE7bK9wzXHyXaOafTU5filyPmJRlFNArMtjVYTHuy9VojtMuC','uhGJepKbosp1RmEfiRrFGXNwPiDHbaKA35AHgFOnTdMUGiumd0','5839ICT','not much','long time','long time with breaks',240,3000,5000,'nathan');
INSERT INTO tbl_courses (id_course,id_degree,id_staff,name,entry_req,full_time_duration,part_time_duration,credit_points,domestic_fee,international_fee,campus)VALUES ('lkbdJZMMleqMCf2fiACHzXnqpbRAOTYr9TAD9FSakpTg0GKgip','w6ofDbgQyQ4V3PQMacqA4brMdkGFBkIBMxxhJAopgwUPHQCJuu','JnDPTso6OQmjfAfkAyxOM11axUTFBHqh7NhDFGGohoYpyPDoiv','3260ICT','not much','long time','long time with breaks',240,3000,5000,'nathan');
INSERT INTO tbl_courses (id_course,id_degree,id_staff,name,entry_req,full_time_duration,part_time_duration,credit_points,domestic_fee,international_fee,campus)VALUES ('KzvTtR0GgUWfcXWeAdWpgyeqXZQvZbzXAd4uMN8HPVdcPaK2ho','ADcbKizUtA9zqRWrXMwcABh0HTtyCSwHmvNLzUnVNkj8tAeBj1','gJqXJAPcuAfrkXynOUSrUizW8fNtZEmDaaSW6w8lvyJrfJAGJ3','7833ICT','not much','long time','long time with breaks',240,3000,5000,'nathan');
/*----------Random student data----------*/

/*---student 0 start---*/
INSERT INTO tbl_person_details (id_person,id_address,first_name,middle_name,last_name,gender,DOB,home_phone,mobile_phone,emergency_phone,street_number,unit_number,address_prefix,notes)VALUES ('gaXD9mZEDlWr78l6skrPzcCtVwTyCeACwVMHCDzJEPwoIovuEp','QLD137415','darcie','phoebe','emmie','male','2020-09-01','3971154528','9422028614','9005842814','9','10','','');
INSERT INTO tbl_student (id_student,id_person) VALUES ('qGDI6GBMyfCItkgWChulqhSrkHThJPdxxHxDcKGrF7RXvMu2b0','gaXD9mZEDlWr78l6skrPzcCtVwTyCeACwVMHCDzJEPwoIovuEp');
INSERT INTO tbl_degree_enrolled (id_enroll,id_student,id_degree,start_date,est_finish_date) VALUES ('GpUYKaitcPxceuJApLABRF0vsuCwwN1IJ2ob3QLdjWUiqKkMCe','qGDI6GBMyfCItkgWChulqhSrkHThJPdxxHxDcKGrF7RXvMu2b0','7BpYRffuQnoWISkJGRFsUibZ8XrVwMZnLEnxAe5Vh8mzVavsiH','2020-09-01','2020-09-01');
INSERT INTO tbl_student_enrolled (id_student_enrolled,id_student,id_course,current_grade,enrolled_status,credit_points,domestic_fee,international_fee,campus) VALUES ('CNpmGdH9ZklrBtZxcdv2SZRxFSDxnIA8ulg4qrgqBNbFEJhZSC','qGDI6GBMyfCItkgWChulqhSrkHThJPdxxHxDcKGrF7RXvMu2b0','ECmyXZYkBXjWwldedwWzmRHq2DwLmoGjJWX1oP4qAHa4nduDDX',4,'registered',10,3000,5000,'nathan');
/*---student 0 end---*/

/*---student 1 start---*/
INSERT INTO tbl_person_details (id_person,id_address,first_name,middle_name,last_name,gender,DOB,home_phone,mobile_phone,emergency_phone,street_number,unit_number,address_prefix,notes)VALUES ('SpczNQqXNhXyfd1vpMzJtGIzMR5wTCxfowSIET2g3XJDiTalrS','QLD109369','john','helena','john','female','2020-09-01','1652952647','8574182935','7893817725','28','23','','');
INSERT INTO tbl_student (id_student,id_person) VALUES ('KToOnlWBLiVZlkzPuWB4uGVb0RUwbsgRjp0GGqb4jwDXrCRkAk','SpczNQqXNhXyfd1vpMzJtGIzMR5wTCxfowSIET2g3XJDiTalrS');
INSERT INTO tbl_degree_enrolled (id_enroll,id_student,id_degree,start_date,est_finish_date) VALUES ('LZwXW1fjVASZpGaiROsyvWtITN4Rsxhdm6LbvzB5cMzEWsNnDj','KToOnlWBLiVZlkzPuWB4uGVb0RUwbsgRjp0GGqb4jwDXrCRkAk','xOd6jjrYGnKBcPNBTXJ2hYfFbviKs0K6CRPwYyaXndpwDMzaPj','2020-09-01','2020-09-01');
INSERT INTO tbl_student_enrolled (id_student_enrolled,id_student,id_course,current_grade,enrolled_status,credit_points,domestic_fee,international_fee,campus) VALUES ('SeCGJXviwvmouqqHMbFV1IePXxn04KPxxu2xBFxDiZZKaDDjDh','KToOnlWBLiVZlkzPuWB4uGVb0RUwbsgRjp0GGqb4jwDXrCRkAk','vnjgx9HAhaCZQ1QgEtkpTRrXgJMo1qXyWjZ9rQUCRoJClLmhFo',4,'registered',10,3000,5000,'nathan');
/*---student 1 end---*/

/*---student 2 start---*/
INSERT INTO tbl_person_details (id_person,id_address,first_name,middle_name,last_name,gender,DOB,home_phone,mobile_phone,emergency_phone,street_number,unit_number,address_prefix,notes)VALUES ('IPO1veJ1lRk9AMTlQNRsMfzWiiqymovYQKVpwOs0fMEIFyryVb','QLD109291','jasmine','shannon','shannon','male','2020-09-01','7278281186','4550279712','2687612728','6','24','','');
INSERT INTO tbl_student (id_student,id_person) VALUES ('KK3wLBZrsqRFsC1rn4LvVHJlFWIgdmjEflVe9WnJFQbdxagNEb','IPO1veJ1lRk9AMTlQNRsMfzWiiqymovYQKVpwOs0fMEIFyryVb');
INSERT INTO tbl_degree_enrolled (id_enroll,id_student,id_degree,start_date,est_finish_date) VALUES ('ZdzmHocbiBDWyZ0zvNgTqrZ07PnXtLewi8BHfiWMCoKTUzEyDN','KK3wLBZrsqRFsC1rn4LvVHJlFWIgdmjEflVe9WnJFQbdxagNEb','G7xUPoHjrpWtdGRko7pcDTRxbAzHTboaklNFQ8iHbNHOkvA6JM','2020-09-01','2020-09-01');
INSERT INTO tbl_student_enrolled (id_student_enrolled,id_student,id_course,current_grade,enrolled_status,credit_points,domestic_fee,international_fee,campus) VALUES ('wZcNewuIiReiCwGjmoWOXLbfW5oPdiKMBFYcV3jVprDl0EqE0L','KK3wLBZrsqRFsC1rn4LvVHJlFWIgdmjEflVe9WnJFQbdxagNEb','BtbkKqfIIGv0EykaDXl5PKk7ubESmhlHYnTwELf9KHZrBuNImg',4,'registered',10,3000,5000,'nathan');
/*---student 2 end---*/

/*---student 3 start---*/
INSERT INTO tbl_person_details (id_person,id_address,first_name,middle_name,last_name,gender,DOB,home_phone,mobile_phone,emergency_phone,street_number,unit_number,address_prefix,notes)VALUES ('ILLRPXamdNVOmSt4gqz4ULGwnuLvZhv08sjrwLvTDlWdFXIghU','QLD109176','jack','darcie','emmie','male','2020-09-01','2355604895','6057599730','4909855430','14','10','','');
INSERT INTO tbl_student (id_student,id_person) VALUES ('wuyARYElZ1ANPaLmzp0nmc4wtDjAl2ACIuaFxlnCdNGNGHKEqb','ILLRPXamdNVOmSt4gqz4ULGwnuLvZhv08sjrwLvTDlWdFXIghU');
INSERT INTO tbl_degree_enrolled (id_enroll,id_student,id_degree,start_date,est_finish_date) VALUES ('FbLvM7JjaDiyujfOibeGgLBN6Y1hHFPDmBKy3WESvfqcrUhBlV','wuyARYElZ1ANPaLmzp0nmc4wtDjAl2ACIuaFxlnCdNGNGHKEqb','WNJ9hpqSRFACiYOgP2CoihNUuFVAHiIopkgcsP8w8zAtjKMcbh','2020-09-01','2020-09-01');
INSERT INTO tbl_student_enrolled (id_student_enrolled,id_student,id_course,current_grade,enrolled_status,credit_points,domestic_fee,international_fee,campus) VALUES ('HQPGMG1Oft6c6kqAWIXaTTDZICwycFjfvmtEpnBtYOwsodZk6l','wuyARYElZ1ANPaLmzp0nmc4wtDjAl2ACIuaFxlnCdNGNGHKEqb','wzJUErdK0ETuq3GBOUUJGlyir43URWFnMvpxCwexYsLeylmiTN',4,'registered',10,3000,5000,'nathan');
/*---student 3 end---*/

/*---student 4 start---*/
INSERT INTO tbl_person_details (id_person,id_address,first_name,middle_name,last_name,gender,DOB,home_phone,mobile_phone,emergency_phone,street_number,unit_number,address_prefix,notes)VALUES ('SCwulUjBpoVVva0LelmIIEmUb12RYJjYiGWMK1osMyEEwkiicD','QLD109291','molly','emmie','emmie','female','2020-09-01','5981240836','5263407783','1067451961','20','3','','');
INSERT INTO tbl_student (id_student,id_person) VALUES ('sKtR4vJRsvyYQFkqbw5aRSOKhpACmVc8LYpNCLaxqueKdqX6IZ','SCwulUjBpoVVva0LelmIIEmUb12RYJjYiGWMK1osMyEEwkiicD');
INSERT INTO tbl_degree_enrolled (id_enroll,id_student,id_degree,start_date,est_finish_date) VALUES ('soVlhZbfYVJM9oAyvAXUN70LHvPfoaPqQjDFrbjtQwZPJW4vip','sKtR4vJRsvyYQFkqbw5aRSOKhpACmVc8LYpNCLaxqueKdqX6IZ','NwrrFcQWklkMMr2WpyraUDa2AmUxoHKhoOux03GUBiJGLviFXX','2020-09-01','2020-09-01');
INSERT INTO tbl_student_enrolled (id_student_enrolled,id_student,id_course,current_grade,enrolled_status,credit_points,domestic_fee,international_fee,campus) VALUES ('iM9YlVpOT0NKXoPxuCo4jdOfrUvNrjkJCbTolNptHJ9ysAwDVS','sKtR4vJRsvyYQFkqbw5aRSOKhpACmVc8LYpNCLaxqueKdqX6IZ','mCfEsBEtSH4SJlpdmJLNYZDabKSZcdECvwNc8qHkxetQ1wjaY0',4,'registered',10,3000,5000,'nathan');
/*---student 4 end---*/

/*---student 5 start---*/
INSERT INTO tbl_person_details (id_person,id_address,first_name,middle_name,last_name,gender,DOB,home_phone,mobile_phone,emergency_phone,street_number,unit_number,address_prefix,notes)VALUES ('UImpdjcoLlSGQItZAXhoyWzkL2TltWSbUm8YEtd9IYLQe7Yyao','QLD109291','mark','darcie','ash','male','2020-09-01','2907278791','6590282383','1376101245','17','18','','');
INSERT INTO tbl_student (id_student,id_person) VALUES ('XdKqGHC2kO2ZEyKWB7fmFcBuWkqpApKhPkjgZpfhvwMY7EJybJ','UImpdjcoLlSGQItZAXhoyWzkL2TltWSbUm8YEtd9IYLQe7Yyao');
INSERT INTO tbl_degree_enrolled (id_enroll,id_student,id_degree,start_date,est_finish_date) VALUES ('lAtfLAyBZLs3FHMbQNQzAwJSQaQRqZvBmyUvd2qThlOxfj6z1w','XdKqGHC2kO2ZEyKWB7fmFcBuWkqpApKhPkjgZpfhvwMY7EJybJ','PygqLlWbBaHsoCBUNBFZK8CLbWspqbfAd1LAsVe3TlB4ncgQbo','2020-09-01','2020-09-01');
INSERT INTO tbl_student_enrolled (id_student_enrolled,id_student,id_course,current_grade,enrolled_status,credit_points,domestic_fee,international_fee,campus) VALUES ('H6qRJbhmMBadraGsoMWv7CIpXVljBQvCBaUJvkSReHWbglmQ08','XdKqGHC2kO2ZEyKWB7fmFcBuWkqpApKhPkjgZpfhvwMY7EJybJ','vaNBArNZNFShCHR6jdGd5E2jjiOewJtXVbVpdeBl1XimENBamg',4,'registered',10,3000,5000,'nathan');
/*---student 5 end---*/

/*---student 6 start---*/
INSERT INTO tbl_person_details (id_person,id_address,first_name,middle_name,last_name,gender,DOB,home_phone,mobile_phone,emergency_phone,street_number,unit_number,address_prefix,notes)VALUES ('IQoFxQt0OEtiTxinNXjnGtpT5SDtD2xsIBtvmBJk2zTBKswDoA','QLD135938','helena','ash','john','male','2020-09-01','5528491486','7987328355','7678435626','0','0','','');
INSERT INTO tbl_student (id_student,id_person) VALUES ('mTTeyv7RhARhyW0jkxqwUWOvKBvxrJoSODW3CFQQdDR5ltaJeu','IQoFxQt0OEtiTxinNXjnGtpT5SDtD2xsIBtvmBJk2zTBKswDoA');
INSERT INTO tbl_degree_enrolled (id_enroll,id_student,id_degree,start_date,est_finish_date) VALUES ('CcBFsMfmxgAMhrmvT1SjtEGuOz2MhhwNVeWa2dmDYISrXPMU7u','mTTeyv7RhARhyW0jkxqwUWOvKBvxrJoSODW3CFQQdDR5ltaJeu','CjE7bK9wzXHyXaOafTU5filyPmJRlFNArMtjVYTHuy9VojtMuC','2020-09-01','2020-09-01');
INSERT INTO tbl_student_enrolled (id_student_enrolled,id_student,id_course,current_grade,enrolled_status,credit_points,domestic_fee,international_fee,campus) VALUES ('dQgCsnqXJibLFPPKzL9IYUfjgZ3lHJAaYiXCgKCu6cxc6grkSy','mTTeyv7RhARhyW0jkxqwUWOvKBvxrJoSODW3CFQQdDR5ltaJeu','jiXF9EOvKTBfvvhMUoWbBtb3ESPqnsP3eDoARdWnZOfqR0ggGd',4,'registered',10,3000,5000,'nathan');
/*---student 6 end---*/

/*---student 7 start---*/
INSERT INTO tbl_person_details (id_person,id_address,first_name,middle_name,last_name,gender,DOB,home_phone,mobile_phone,emergency_phone,street_number,unit_number,address_prefix,notes)VALUES ('QfHuZ44z4XnUoiAQYEgsKSsNNb8etJolcfTHhtWFzSUWrCegfH','QLD136676','ash','phoebe','molly','female','2020-09-01','9634402059','8654729222','4264853808','13','0','','');
INSERT INTO tbl_student (id_student,id_person) VALUES ('jL1m8nvpS3TYsWIfFkCIJsTmU9jTMTeGvNowVpokimdBIOhzZI','QfHuZ44z4XnUoiAQYEgsKSsNNb8etJolcfTHhtWFzSUWrCegfH');
INSERT INTO tbl_degree_enrolled (id_enroll,id_student,id_degree,start_date,est_finish_date) VALUES ('3EGRoKgnUkKGHhGnlgFywr4dMUDd50mzlTUnDmnBNzPSsenTOY','jL1m8nvpS3TYsWIfFkCIJsTmU9jTMTeGvNowVpokimdBIOhzZI','w6ofDbgQyQ4V3PQMacqA4brMdkGFBkIBMxxhJAopgwUPHQCJuu','2020-09-01','2020-09-01');
INSERT INTO tbl_student_enrolled (id_student_enrolled,id_student,id_course,current_grade,enrolled_status,credit_points,domestic_fee,international_fee,campus) VALUES ('FwAEmMCMHzSPFIP1dQ0XZxusrO4reYRyNRnVrvFyZ0ahtzyjyk','jL1m8nvpS3TYsWIfFkCIJsTmU9jTMTeGvNowVpokimdBIOhzZI','lkbdJZMMleqMCf2fiACHzXnqpbRAOTYr9TAD9FSakpTg0GKgip',4,'registered',10,3000,5000,'nathan');
/*---student 7 end---*/

/*---student 8 start---*/
INSERT INTO tbl_person_details (id_person,id_address,first_name,middle_name,last_name,gender,DOB,home_phone,mobile_phone,emergency_phone,street_number,unit_number,address_prefix,notes)VALUES ('NghwxlwDSiyPCyYVVMsKto8SE7XWKFfzD04UukWSpqgsZVPwlw','QLD109176','jack','helena','shannon','male','2020-09-01','3320993207','1541353406','1815584918','5','2','','');
INSERT INTO tbl_student (id_student,id_person) VALUES ('ByfSxsvye6gCaFiyqTIzUXuJZBqqNZOpMdiJa1BR5GX5eQNnDl','NghwxlwDSiyPCyYVVMsKto8SE7XWKFfzD04UukWSpqgsZVPwlw');
INSERT INTO tbl_degree_enrolled (id_enroll,id_student,id_degree,start_date,est_finish_date) VALUES ('oSMuWhAyQVCIKSRkGvey3mTGZU3fEzZuElgW5phzvRJpbw6aSr','ByfSxsvye6gCaFiyqTIzUXuJZBqqNZOpMdiJa1BR5GX5eQNnDl','ADcbKizUtA9zqRWrXMwcABh0HTtyCSwHmvNLzUnVNkj8tAeBj1','2020-09-01','2020-09-01');
INSERT INTO tbl_student_enrolled (id_student_enrolled,id_student,id_course,current_grade,enrolled_status,credit_points,domestic_fee,international_fee,campus) VALUES ('DIsdxSTFVgnFfZEyXPUJ1zxXog8spo6DiuMZMGAccqukOPCf6m','ByfSxsvye6gCaFiyqTIzUXuJZBqqNZOpMdiJa1BR5GX5eQNnDl','KzvTtR0GgUWfcXWeAdWpgyeqXZQvZbzXAd4uMN8HPVdcPaK2ho',4,'registered',10,3000,5000,'nathan');
/*---student 8 end---*/


/*----------Create Views----------*/

create view admin_staff_enrollment
as select
  tbl_degree_enrolled.id_enroll,
  tbl_degree_enrolled.id_student,
  tbl_degree_enrolled.id_degree,
  tbl_degree_enrolled.start_date,
  tbl_degree_enrolled.est_finish_date,
  tbl_student_enrolled.id_student_enrolled,
  tbl_student_enrolled.id_course,
  tbl_student_enrolled.enrolled_status,
  tbl_student_enrolled.campus
from
  tbl_degree_enrolled
  inner join tbl_student_enrolled on tbl_degree_enrolled.id_student = tbl_student_enrolled.id_student;
  
  
  
create view admin_staff_enrollment_student_view as
select
	admin_staff_enrollment.id_student,
	tbl_degrees.name as 'Degree_Name',
	tbl_degrees.campus as 'Campus_Degree',
	tbl_courses.name as 'Course_Name',
	tbl_courses.campus as 'Campus_Course',
	tbl_student_enrolled.enrolled_status
from
  admin_staff_enrollment
  inner join tbl_degrees on tbl_degrees.id_degree = admin_staff_enrollment.id_degree
  inner join tbl_courses on tbl_courses.id_course = admin_staff_enrollment.id_course
  inner join tbl_student_enrolled on admin_staff_enrollment.id_student = tbl_student_enrolled.id_student;
  
  
create view student_mark_view as
select
	tbl_courses.name,
    tbl_student_enrolled.id_student,
	tbl_student_enrolled.current_grade,
	tbl_student_enrolled.credit_points
from 
	tbl_courses
inner join tbl_student_enrolled on tbl_courses.id_course = tbl_student_enrolled.id_course;




create view academic_staff_enroll_view as
select
	tbl_student_enrolled.id_course,
	tbl_courses.name,
	tbl_courses.campus,
	tbl_student.id_student,
	tbl_student.id_person,
	tbl_student_enrolled.current_grade,
	tbl_person_details.first_name as 'Student_First_Name',
	tbl_person_details.last_name as 'Student_Last_Name',
	tbl_person_details.gender as 'Student_Gender'
from tbl_courses
	inner join tbl_student_enrolled on tbl_student_enrolled.id_course = tbl_courses.id_course
	inner join tbl_student on tbl_student.id_student = tbl_student_enrolled.id_student
	inner join tbl_person_details on tbl_person_details.id_person = tbl_student.id_person;
	

create view person_update_view as
select
	tbl_person_details.id_person,
	tbl_person_details.first_name,
	tbl_person_details.middle_name,
	tbl_person_details.last_name,
	tbl_person_details.DOB,
	tbl_person_details.home_phone,
	tbl_person_details.mobile_phone,
	tbl_person_details.emergency_phone,
	tbl_person_details.gender,
	tbl_person_details.id_address,
	tbl_person_details.unit_number,
	tbl_person_details.address_prefix,
	tbl_person_details.street_number,
	tbl_address.street_name,
	tbl_address.street_type,
	tbl_address.suburb,
	tbl_address.postcode,
	tbl_address.longitude,
	tbl_address.latitude
from tbl_person_details
	inner join tbl_address on tbl_address.id_address = tbl_person_details.id_address;
	

/*---grant permissions---*/

/* had complications with creating roles
create role admin;
create role admin_staff_enrollment;
create role admin_staff_course;
create role academic_staff;
create role student;
*/

/*----------create users----------*/

DROP USER IF EXISTS 'admin_121'@'localhost';
DROP USER IF EXISTS 'admin_staff_enrollment_121'@'localhost';
DROP USER IF EXISTS 'admin_staff_course_121'@'localhost';
DROP USER IF EXISTS 'academic_staff_121'@'localhost';
DROP USER IF EXISTS 'student_121'@'localhost';


CREATE USER IF NOT EXISTS 'admin_121'@'localhost' IDENTIFIED BY 'Password8!';
CREATE USER IF NOT EXISTS 'admin_staff_enrollment_121'@'localhost' IDENTIFIED BY 'Password8!';
CREATE USER IF NOT EXISTS 'admin_staff_course_121'@'localhost' IDENTIFIED BY 'Password8!';
CREATE USER IF NOT EXISTS 'academic_staff_121'@'localhost' IDENTIFIED BY 'Password8!';
CREATE USER IF NOT EXISTS 'student_121'@'localhost' IDENTIFIED BY 'Password8!';

/*----------admin permissions----------*/
GRANT ALL PRIVILEGES ON assignment2_121.* TO 'admin_121'@'localhost';

/*----------academic_staff_enrollment permissions----------*/
GRANT SELECT,INSERT,UPDATE,DELETE ON assignment2_121.tbl_degree_enrolled TO 'admin_staff_enrollment_121'@'localhost';
GRANT SELECT,INSERT,UPDATE,DELETE ON assignment2_121.tbl_student_enrolled TO 'admin_staff_enrollment_121'@'localhost';

/*----------admin_staff_course permissions----------*/
GRANT SELECT,INSERT,UPDATE,DELETE ON assignment2_121.tbl_degrees TO 'admin_staff_course_121'@'localhost';
GRANT SELECT,INSERT,UPDATE,DELETE ON assignment2_121.tbl_courses TO 'admin_staff_course_121'@'localhost';

/*----------academic_staff permissions----------*/
GRANT SELECT,UPDATE ON assignment2_121.tbl_degrees TO 'academic_staff_121'@'localhost';
GRANT SELECT,UPDATE ON assignment2_121.tbl_courses TO 'academic_staff_121'@'localhost';

GRANT SELECT (id_person) ON assignment2_121.tbl_person_details TO 'academic_staff_121'@'localhost';
GRANT SELECT (first_name) ON assignment2_121.tbl_person_details TO 'academic_staff_121'@'localhost';
GRANT SELECT (last_name) ON assignment2_121.tbl_person_details TO 'academic_staff_121'@'localhost';
GRANT SELECT (gender) ON assignment2_121.tbl_person_details TO 'academic_staff_121'@'localhost';
GRANT SELECT (notes) ON assignment2_121.tbl_person_details TO 'academic_staff_121'@'localhost';

GRANT SELECT (id_person) ON assignment2_121.tbl_student TO 'academic_staff_121'@'localhost';
GRANT SELECT (id_student) ON assignment2_121.tbl_student TO 'academic_staff_121'@'localhost';

/*----------student permissions----------*/
GRANT SELECT (id_person) ON assignment2_121.tbl_student TO 'student_121'@'localhost';
GRANT SELECT (id_student) ON assignment2_121.tbl_student TO 'student_121'@'localhost';

GRANT SELECT ON assignment2_121.tbl_courses TO 'student_121'@'localhost';
GRANT SELECT,UPDATE ON assignment2_121.tbl_person_details TO 'student_121'@'localhost';

GRANT SELECT ON assignment2_121.tbl_degree_enrolled TO 'student_121'@'localhost';
GRANT SELECT ON assignment2_121.tbl_student_enrolled TO 'student_121'@'localhost';
GRANT SELECT ON assignment2_121.tbl_degrees TO 'student_121'@'localhost';

/*----------grant all users select permissions on location----------*/

GRANT SELECT ON assignment2_121.tbl_address TO 'admin_staff_enrollment_121'@'localhost';
GRANT SELECT ON assignment2_121.tbl_address TO 'admin_staff_course_121'@'localhost';
GRANT SELECT ON assignment2_121.tbl_address TO 'academic_staff_121'@'localhost';
GRANT SELECT ON assignment2_121.tbl_address TO 'student_121'@'localhost';

/*----------grant view permissions----------*/

GRANT SELECT ON assignment2_121.student_mark_view TO 'student_121'@'localhost';
GRANT SELECT ON assignment2_121.academic_staff_enroll_view TO 'academic_staff_121'@'localhost';
GRANT UPDATE (current_grade) ON assignment2_121.academic_staff_enroll_view TO 'academic_staff_121'@'localhost';
GRANT SELECT,UPDATE ON assignment2_121.admin_staff_enrollment TO 'admin_staff_enrollment_121'@'localhost';
GRANT SELECT,UPDATE ON assignment2_121.admin_staff_enrollment_student_view TO 'admin_staff_course_121'@'localhost';
GRANT SELECT,UPDATE ON assignment2_121.admin_staff_enrollment TO 'admin_staff_course_121'@'localhost';
GRANT SELECT,UPDATE ON assignment2_121.admin_staff_enrollment_student_view TO 'admin_staff_enrollment_121'@'localhost';
GRANT SELECT,UPDATE (id_person,id_address,first_name,last_name,middle_name,DOB,home_phone,mobile_phone,emergency_phone,gender,unit_number,street_number,address_prefix) ON assignment2_121.person_update_view TO 'student_121'@'localhost';

FLUSH PRIVILEGES;