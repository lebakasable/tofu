import lib.std


const CLIENT_BUF_CAP 1024
buffer client_buf 8

to start: -> void
    buffer servaddr 8
    buffer cliaddr  8
    buffer clilen   4
    buffer quit     1
    false quit setb

    AF_INET SOCK_STREAM 0 socket
    dup 0 < if
        "ERROR: could not create TCP socket\n" error
        1 exit

    "Successfully created a socket: " puts
    dup                               puti
    "\n"                              puts

    SOCKADDR_SIZE zalloc servaddr setp
    AF_INET      servaddr sockaddr_in.sin_family + seti
    INADDR_LOCAL servaddr sockaddr_in.sin_addr   + seti
    PORT htons   servaddr sockaddr_in.sin_port   + seti

    dup servaddr SOCKADDR_SIZE bind 0 < if
        "ERROR: could not bind the socket\n" error
        1 exit

    "Successufully bound the socket to port " puts
    PORT                                      puti
    "\n"                                      puts

    dup 5 listen 0 < if
        "ERROR: could not start listening\n" error
        1 exit

    "Successfully started listening\n" puts

    while quit derefb true !=
        dup cliaddr clilen accept
        dup 0 < if
            "ERROR: server accept failed\n" error
            1 exit

        "Server accepted the client\n" puts

        dup client_buf CLIENT_BUF_CAP read
        dup 0 < if
            "ERROR: could not read the client request\n" error
            1 exit

        client_buf "\r" derefc chop_first
        ' ' chop_before ' ' chop_after

        dup "/quit" streq if
            over "HTTP/1.1 200 OK\r\n"                   write
            over "Content-Type: text/html\r\n"           write
            over "Connection: Closed\r\n"                write
            over "\r\n"                                  write
            over "<h1>Shutting down the server...</h1>"  write

            true quit setb
        else
            over "HTTP/1.1 200 OK\r\n"                   write
            over "Content-Type: text/html\r\n"           write
            over "Connection: Closed\r\n"                write
            over "\r\n"                                  write
            over "<h1>Hello, World!</h1>"                write
        drop

        close
        drop

    close
