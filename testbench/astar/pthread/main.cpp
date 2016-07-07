#include<stdio.h>
#include<stdlib.h>
#include<iostream>
#include<vector>

#define DUMP
#ifdef DUMP
#include <m5op.h>
#endif

#ifndef DUMP
#include <pthread.h>
#endif

#define NUM 16
#define MAX 1024

int SIZE[NUM] = {0};
pthread_barrier_t barr;
int startID;
int endID;

pthread_mutex_t lock;

using namespace std;

class Node;

Node** nodes[NUM];
vector<Node*> vec_nodes[NUM];
int length[NUM] = {0};

class Node
{
    public:
    int id;
    int line;
    int* suc;
    int* suc_dist;
    int default_size;
    int real_size;
    int cur_f;
    int cur_g;

    Node(int value, int p_id)
    {
        id = SIZE[p_id];
        SIZE[p_id] = SIZE[p_id] + 1;
        line = value;
        default_size = 20;    
        real_size = 0;
        cur_f = MAX;
        cur_g = 0;
        suc = new int[default_size];
        suc_dist = new int[default_size];
        vec_nodes[p_id].push_back(this);
    }
    
    int getID()
    {
        return id;    
    }

    void setF(int f)
    {
        cur_f = f;  
    }

    void setG(int g)
    {
        cur_g = g;    
    }

    int getF()
    {
        return cur_f;    
    }

    int getG()
    {
        return cur_g;    
    }

    int getLine()
    {
        return line;    
    }

    int getSize()
    {
        return real_size;    
    }

    void addSucc(Node* node, int dist)
    {
        if(real_size == default_size)
        {
            default_size = 2 * default_size;
            int* new_suc = new int[default_size];
            int* new_suc_dist = new int[default_size];
            for(int i = 0; i < real_size; ++ i)
            {
                new_suc[i] = suc[i];
                new_suc_dist[i] = suc_dist[i];
            }
            suc = new_suc;
            suc_dist = new_suc_dist;
        }
        suc[real_size] = node->getID();
        suc_dist[real_size] = dist;
        ++real_size;
    }

    int getSucc(int i)
    {
        return suc[i];
    }

    int getSuccDist(int i)
    {
        return suc_dist[i];    
    }
};

void init()
{
    for(int id = 0; id < NUM; ++id)
    {
        Node* s = new Node(70, id);
        s->setF(0);
        Node* a = new Node(60, id);
        Node* b = new Node(20, id);
        Node* c = new Node(10, id);
        Node* g = new Node(0, id);

        Node* d = new Node(50, id);
        Node* e = new Node(60, id);
        Node* s1 = new Node(65, id);
        Node* s2 = new Node(65, id);
        Node* s3 = new Node(65, id);
        Node* s4 = new Node(65, id);
        Node* s5 = new Node(65, id);
        Node* s6 = new Node(65, id);
        Node* s7 = new Node(65, id);
        Node* s8 = new Node(65, id);
        Node* s9 = new Node(65, id);
        Node* s10 = new Node(65, id);
        Node* s11 = new Node(65, id);
        Node* s12 = new Node(65, id);
        Node* s13 = new Node(65, id);
        Node* s14 = new Node(65, id);
        Node* s15 = new Node(65, id);
        Node* s16 = new Node(65, id);
        Node* f = new Node(20, id);
        Node* t = new Node(10, id);
        Node* h = new Node(60, id);
        Node* i = new Node(20, id);
        Node* u = new Node(30, id);
        Node* j = new Node(60, id);
        Node* k = new Node(20, id);
        Node* v = new Node(30, id);
        Node* l = new Node(60, id);
        Node* m = new Node(20, id);
        Node* w = new Node(30, id);
        Node* n = new Node(60, id);
        Node* o = new Node(20, id);
        Node* x = new Node(30, id);
        Node* p = new Node(60, id);
        Node* q = new Node(20, id);
        Node* y = new Node(10, id);
        Node* r = new Node(30, id);
        Node* z = new Node(20, id);

        s1->addSucc(a, 10);
        s2->addSucc(b, 40);
        a->addSucc(b, 20);
        a->addSucc(c, 50);
        a->addSucc(g, 120);
        b->addSucc(c, 20);
        c->addSucc(g, 30);

        s->addSucc(s1, 10);
        s->addSucc(s2, 10);
        s->addSucc(s3, 10);
        s->addSucc(s4, 10);
        s->addSucc(s5, 10);
        s->addSucc(s6, 10);
        s->addSucc(s7, 10);
        s->addSucc(s8, 10);
        s->addSucc(s9, 10);
        s->addSucc(s10, 10);
        s->addSucc(s11, 10);
        s->addSucc(s12, 10);
        s->addSucc(s13, 10);
        s->addSucc(s14, 10);
        s->addSucc(s15, 10);
        s->addSucc(s16, 10);
        s3->addSucc(d, 40);
        d->addSucc(c, 60);
        d->addSucc(g, 40);
        s4->addSucc(e, 10);
        e->addSucc(d, 40);
        s5->addSucc(f, 40);
        e->addSucc(t, 50);
        e->addSucc(f, 20);
        f->addSucc(t, 20);
        t->addSucc(g, 30);

        s6->addSucc(h, 10);
        s7->addSucc(i, 40);
        h->addSucc(i, 20);
        h->addSucc(u, 50);
        i->addSucc(u, 20);
        u->addSucc(g, 30);
        s8->addSucc(j, 10);
        s9->addSucc(k, 40);
        j->addSucc(k, 20);
        j->addSucc(v, 50);
        k->addSucc(v, 20);
        v->addSucc(g, 30);
        s10->addSucc(l, 10);
        s11->addSucc(m, 40);
        l->addSucc(m, 20);
        l->addSucc(w, 50);
        m->addSucc(w, 20);
        w->addSucc(g, 30);
        s12->addSucc(n, 10);
        s13->addSucc(o, 40);
        n->addSucc(o, 20);
        n->addSucc(x, 50);
        o->addSucc(x, 20);
        x->addSucc(g, 30);
        s14->addSucc(p, 10);
        s15->addSucc(q, 40);
        p->addSucc(q, 20);
        p->addSucc(y, 50);
        q->addSucc(y, 20);
        y->addSucc(g, 20);
        s16->addSucc(r, 50);
        r->addSucc(z, 50);
        z->addSucc(g, 50);

        nodes[id] = new Node*[SIZE[id]];
        
        for(int i = 0; i < SIZE[id]; ++i)
        {
            nodes[id][vec_nodes[id].back()->getID()] = vec_nodes[id].back();
            vec_nodes[id].pop_back();
        }
    }

    startID = 0;
    endID = 4;
}

//void startSearch(Node** nodes, int startID, int endID)
void *startSearch(void *myid)
{
    int *a = (int*)myid;
    int id = *a;

    bool already_split = false;
    int start = startID;
    int end = endID;
    Node* cur_node = nodes[id][start];
    int cur_f;
    int cur_g;
    int succ_f;
    Node* succ_node;
    int minF;

if(id == 0)
{
#ifdef DUMP
    m5_dump_stats(0, 0);
    m5_reset_stats(0, 0);
#endif
}

    while(cur_node->getID() != end)
    {
        cur_f = cur_node->getF();
        cur_g = cur_node->getG();
        for(int i = 0; i < cur_node->getSize(); ++i)
        {
            succ_node = nodes[id][cur_node->getSucc(i)];
            succ_f = cur_g + cur_node->getSuccDist(i) + succ_node->getLine();
            if(succ_node->getF() > succ_f)
            {
                succ_node->setG(cur_g + cur_node->getSuccDist(i));
                succ_node->setF(succ_f);
            }
        }
        cur_node->setF(MAX);    
        minF = nodes[id][0]->getF();

        if(already_split)
        {
            for(int i = 0; i < SIZE[id]; ++i)
            {
                if(nodes[id][i]->getF() < minF)
                {
                    cur_node = nodes[id][i]; 
                    minF = cur_node->getF();
                }
            }
        }
        else
        {
            int times = 0;
            for(int i = 0; i < SIZE[id]; ++i)
            {
                if(nodes[id][i]->getF() < MAX)
                {
                    if(id == times)
                    {
                        cur_node = nodes[id][i];
                        minF = cur_node->getF();
                    }
                    else
                    {
                        nodes[id][i]->setF(MAX);
                    }
                    ++times;
                }
            }
            already_split = true;    
        }
    }
    
//    printf("\nCore %d get path length = %d; cur_node = %d.\n", *a, cur_node->getG(), cur_node->getID());

    length[id] = cur_node->getG();

if(id == 13)
{
#ifdef DUMP
    m5_dump_stats(0, 0);
    m5_reset_stats(0, 0);
#endif
}

    pthread_barrier_wait(&barr);

}

int main()
{
    pthread_t threads[NUM];
    int tid[NUM];

    init();
    printf("\n-----------------Init Finished------------------\n");

    pthread_barrier_init(&barr, NULL, NUM);

    for(int x=0; x<NUM-1; ++x)
    {
        tid[x] = x;
        pthread_create(&threads[x], NULL, startSearch, (void *)(tid+x));
    }

    tid[NUM-1] = NUM - 1;
    startSearch((void*)(tid+NUM-1));

    int minL = length[0];
    int core = 0;
    for(int x=1; x<NUM; ++x)
    {
        if(minL > length[x])
        {
            minL = length[x];
            core = x;
        }
    }

    printf("\n-----------------All Finished------------------\n");
    printf("\nCore %d got the shortest parth = %d.\n", core, minL);
    return 0;
}
