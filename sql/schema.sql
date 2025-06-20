


CREATE TABLE IF NOT EXISTS users (
  user_id   INT AUTO_INCREMENT PRIMARY KEY,
  username  VARCHAR(40)  UNIQUE NOT NULL,
  email     VARCHAR(100) UNIQUE NOT NULL,
  pwd_hash  CHAR(60)     NOT NULL,                 
  role      ENUM('buyer','seller','admin') DEFAULT 'buyer',
  created   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE IF NOT EXISTS properties (
  property_id INT AUTO_INCREMENT PRIMARY KEY,
  owner_id    INT          NOT NULL,              
  title       VARCHAR(100) NOT NULL,
  price       DECIMAL(12,2) NOT NULL,
  location    VARCHAR(120) NOT NULL,
  type        ENUM('house','apartment','commercial'),
  status      ENUM('active','pending','sold') DEFAULT 'active',
  listed      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (owner_id) REFERENCES users(user_id)
);


CREATE TABLE IF NOT EXISTS inquiries (
  inquiry_id  INT AUTO_INCREMENT PRIMARY KEY,
  property_id INT NOT NULL,                        
  buyer_id    INT NOT NULL,                        
  message     TEXT,
  status      ENUM('open','responded','closed') DEFAULT 'open',
  created     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (property_id) REFERENCES properties(property_id),
  FOREIGN KEY (buyer_id)    REFERENCES users(user_id)
);



