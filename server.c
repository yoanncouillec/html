#define _POSIX_SOURCE 1
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <strings.h>
#include <string.h>
#include <fcntl.h>

int main (int argc, char * argv[]){
  int server_socket;
  int client_socket;
  char c;
  struct sockaddr_in local;
  int port;

  /* Command line arguments */
  if (argc < 2){
    fprintf(stderr, "Usage: %s <port>\n", argv[0]);
    exit(EXIT_FAILURE);
  }
  port = atoi(argv[1]);
  
  /* Create socket */
  if ((server_socket = socket(AF_INET, SOCK_STREAM, 0)) == -1) {
    perror("socket");
    exit(EXIT_FAILURE);
  }
  printf ("Socket OK\n");

  /* Initialize local information */
  memset ((void *)&local, 0, (size_t) sizeof(local));
  local.sin_addr.s_addr = htonl(INADDR_ANY);
  local.sin_port = htons(port);
  local.sin_family = AF_INET;

  /* Bind the socket */
  if (bind(server_socket,(struct sockaddr *)&local,sizeof(local)) == -1) {
    perror("bind");
    exit (EXIT_FAILURE);
  }
  printf ("Bind OK\n");

  /* Listen the socket for 1 client */
  if (listen (server_socket, 1) == -1){
    perror ("listen");
    exit (EXIT_FAILURE);
  }
  printf ("Listen OK\n");

  /* Accept 1 client */
  if ((client_socket = accept (server_socket,
			       (struct sockaddr *) 0,
			       (socklen_t *)0)) == -1){
    perror ("accept");
    exit (EXIT_FAILURE);
  }
  printf ("Accept OK\n");

  for (;;) {
    read (client_socket, &c, sizeof(c));
    write (client_socket, &c, sizeof(c));
  }

  return EXIT_SUCCESS;
}
