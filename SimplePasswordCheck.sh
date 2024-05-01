#!/bin/bash

# Function to check password strength
check_password_strength() {
    password=$1
    len=${#password}

    # Check length
    if [ $len -lt 8 ]; then
        echo "Weak: Password length should be at least 8 characters"
        return
    fi

    # Check for presence of numbers
    if ! [[ "$password" =~ [0-9] ]]; then
        echo "Weak: Password should contain at least one digit"
        return
    fi

    # Check for presence of uppercase letters
    if ! [[ "$password" =~ [A-Z] ]]; then
        echo "Weak: Password should contain at least one uppercase letter"
        return
    fi

    # Check for presence of lowercase letters
    if ! [[ "$password" =~ [a-z] ]]; then
        echo "Weak: Password should contain at least one lowercase letter"
        return
    fi

    # Check for presence of special characters
    if ! [[ "$password" =~ [^a-zA-Z0-9] ]]; then
        echo "Weak: Password should contain at least one special character"
        return
    fi

    # If all checks pass
    echo "Strong: Password strength is good"
}

# Main script starts here
echo "Enter your password:"
read -s user_password  # -s flag hides the input

echo "Checking password strength..."
check_password_strength "$user_password"
