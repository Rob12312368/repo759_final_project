with open("example.txt", "w") as f:
    text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. " * 200  # Adjust as needed
    while f.tell() < 100 * 1024 * 1024:  # 100MB
        f.write(text)