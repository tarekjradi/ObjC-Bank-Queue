ObjC-Bank-Queue
===========

Documentação das classes no wiki.

Bank
=====

Fonte
-----

[OBI - Nivel 2 - Banco](http://olimpiada.ic.unicamp.br/pratique/programacao/nivel2/2012f2p2_banco)

ACADEMIC WORK

Current legislation requires banks to begin serving a customer within 20 minutes of the customer entering the bank branch's single queue. The queue is single, so a free teller asks the first customer in the queue to come to his/her counter to be served. (We will ignore the problem of priority customers, elderly people, pregnant women, people with special needs, etc.) We are also assuming that no teller serves two customers at the same time.

Your program will receive the number of active tellers in the branch, the number of customers and, for each customer, two pieces of information, namely, the time the customer entered the queue and the duration of that customer's service.

Initially, all the tellers are empty, since the branch has just opened.

Your problem is to determine the number of customers who will wait more than 20 minutes to have their service started.

Input

The first line of the input contains two integers separated by a blank space. The first, C, is the number of active tellers in the bank branch. The second, N, is the number of customers who will seek service at the agency that day.

The next N lines will each contain information about a customer, consisting of two integers, T and D, separated by a blank space. The integer T gives the time at which the customer enters the queue, in minutes, from the moment the agency opens. The integer D gives, in minutes, the time required to serve the customer.

The lines are ordered by customer entry into the queue.

Output

The output should contain only one line, containing a single integer, the number of customers whose service will begin more than 20 minutes after they enter the queue.

### Restrições

    1 ≤ C ≤ 10
    1 ≤ N ≤ 1000
    0 ≤ T ≤ 300
    1 ≤ D ≤ 10

### Exemplos

Entrada

    1 5
    0 10
    0 10
    1 10
    2 10
    30 10


Saída

    1

Entrada

    3 16
    0 10
    0 10
    0 10
    3 10
    5 10
    7 10
    11 10
    13 10
    14 10
    15 10
    16 10
    17 10
    18 3
    19 10
    20 10
    23 3

Saída

    2
