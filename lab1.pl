% Domain: pharmacies, medicines
% Facts: pharmacy(id, network_name, address, phone)
pharmacy(1, 'Healthy Living', '123 Main St.', '555-1234').
pharmacy(2, 'CVS', '456 Elm St.', '555-5678').
pharmacy(3, 'Walgreens', '789 Maple St.', '555-9012').

% medicine(id, name)
medicine(1, 'Aspirin').
medicine(2, 'Ibuprofen').
medicine(3, 'Acetaminophen').

% Sells(pharmacy_id, medicine_id, price, quantity)
sells(1, 1, 5.99, 50).
sells(1, 2, 6.99, 25).
sells(2, 1, 6.49, 75).
sells(2, 2, 7.49, 100).
sells(3, 1, 6.99, 100).
sells(3, 3, 8.99, 50).

% Rule: Pharmacy address/phone number by name/id
pharmacy_info(Id, Name, Address, Phone) :-
    pharmacy(Id, Name, Address, Phone).

% Rule: Phone number of the pharmacy where the given medicine is available in an amount not less than N
pharmacy_with_medicine(Medicine, N, Pharmacy, Phone) :-
    sells(Pharmacy, Medicine, _, Quantity),
    Quantity >= N,
    pharmacy(Pharmacy, _, _, Phone).
