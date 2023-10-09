with open("oscheck.sh", "r") as f:
    result = ""
    last_space = True
    for char in f.read():
        if char == "\n":
            char = " "
        if char == " ":
            if not last_space:
                result += char
                last_space = True
        else:
            last_space = False
            result += char

print(result)