GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY PASSWORD '*66E69629AEA44A65DA0FE375D466D644C766060F' WITH GRANT OPTION;
GRANT PROXY ON ''@'' TO 'root'@'localhost' WITH GRANT OPTION;
GRANT USAGE ON *.* TO 'ossec_user'@'%' IDENTIFIED BY PASSWORD '*C30C2BEB52486EF5276EA88ED5CB9BFC57E3E041';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, EXECUTE ON `ossecdb`.* TO 'ossec_user'@'%';
FLUSH PRIVILEGES;
