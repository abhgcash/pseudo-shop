#!/bin/bash

# Set the filename
FILENAME="auth_system.txt"

echo "Starting the 3-commit automated process..."

# ==========================================
# COMMIT 1: The User Class and Global List
# ==========================================
cat << 'EOF' > $FILENAME
# Represents a registered user
class User:
    function initialize(name, email, password):
        self.name = name
        self.email = email
        self.password = password # In-memory plain text for pseudo-code simplicity

# Global in-memory list to store registered users
global_users_list = []
EOF

git add $FILENAME
git commit -m "Commit 1: Add User class and global user list"
echo "First commit successful!"

# ==========================================
# COMMIT 2: The Registration Function
# ==========================================
cat << 'EOF' >> $FILENAME

# Create a new user account
function create_user(name, email, password):
    # Basic validation: ensure email isn't already taken
    for each user in global_users_list:
        if user.email == email:
            print "Registration failed: Email already exists."
            return false
            
    new_user = new User(name, email, password)
    append new_user to global_users_list
    print "Registration successful for: " + name
    return true
EOF

git add $FILENAME
git commit -m "Commit 2: Add create_user registration function"
echo "Second commit successful!"

# ==========================================
# COMMIT 3: The Login Function
# ==========================================
cat << 'EOF' >> $FILENAME

# Authenticate an existing user
function login_user(email, password):
    for each user in global_users_list:
        if user.email == email and user.password == password:
            
            # =========================================================
            # [ACTIVITY INSTRUCTION: TRIGGER MERGE CONFLICT HERE]
            # Partner 1: Delete line 34 and change it to: print "Access Granted! Hello, " + user.name
            # Partner 2: Delete line 34 and change it to: print "Welcome to the system, " + user.name
            # =========================================================
            print "Login successful! Welcome back, " + user.name
            
            return true
            
    print "Login failed: Invalid credentials."
    return false
EOF

git add $FILENAME
git commit -m "Commit 3: Add login_user authentication function"
echo "Third commit successful! Run 'git log --oneline' to view your history."
