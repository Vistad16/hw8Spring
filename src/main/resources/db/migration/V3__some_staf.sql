INSERT INTO users (id, email, role, password, first_name, last_name)
VALUES ('2458bc8e-ff09-4008-acc5-0d7b5ad3dd6f',
        'user@user.com',
        'ROLE_USER',
        '$2a$12$Csq6cujUEpuWs5OZDr8Vc.Zz0k4avyiibMOS7MCOILC1f6MuTct0W',
        'user',
        'user');

INSERT INTO vendor (id, name)
VALUES ('2f7d8e6b-52ca-4f89-81c9-8b32cbe293e3','Atari'),
       ('709df06b-d59a-4634-bdc5-a888a978e459' ,'Nintendo');

INSERT INTO product (name, price, vendor_id)
VALUES ('NES', 300, '2f7d8e6b-52ca-4f89-81c9-8b32cbe293e3'),
       ('Dendy', 350, '709df06b-d59a-4634-bdc5-a888a978e459');