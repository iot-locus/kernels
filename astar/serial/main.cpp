#include<stdio.h>
#include<vector>

#define DUMP
#ifdef DUMP
#include <m5op.h>
#endif

int SIZE = 0;
using namespace std;

class Node;

vector<Node*> vec_nodes;

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

    Node(int value)
    {
        id = SIZE;
        SIZE = SIZE + 1;
        line = value;
        default_size = 10;    
        real_size = 0;    
        cur_f = 1024;
        cur_g = 0;
        suc = new int[default_size];
        suc_dist = new int[default_size];
        vec_nodes.push_back(this);
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
        suc_dist[real_size] = dist;
        suc[real_size] = node->getID();
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

Node** init()
{
    Node** nodes;

    Node* s = new Node(70);
    s->setF(0);
    Node* a = new Node(60);
    Node* b = new Node(20);
    Node* c = new Node(10);
    Node* g = new Node(0);

    Node* d = new Node(50);
    Node* e = new Node(60);
    Node* s1 = new Node(65);
    Node* s2 = new Node(65);
    Node* s3 = new Node(65);
    Node* s4 = new Node(65);
    Node* s5 = new Node(65);
    Node* s6 = new Node(65);
    Node* s7 = new Node(65);
    Node* s8 = new Node(65);
    Node* s9 = new Node(65);
    Node* s10 = new Node(65);
    Node* s11 = new Node(65);
    Node* s12 = new Node(65);
    Node* s13 = new Node(65);
    Node* s14 = new Node(65);
    Node* s15 = new Node(65);
    Node* s16 = new Node(65);
    Node* f = new Node(20);
    Node* t = new Node(10);
    Node* h = new Node(60);
    Node* i = new Node(20);
    Node* u = new Node(30);
    Node* j = new Node(60);
    Node* k = new Node(20);
    Node* v = new Node(30);
    Node* l = new Node(60);
    Node* m = new Node(20);
    Node* w = new Node(30);
    Node* n = new Node(60);
    Node* o = new Node(20);
    Node* x = new Node(30);
    Node* p = new Node(60);
    Node* q = new Node(20);
    Node* y = new Node(10);
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

    nodes = new Node*[SIZE];
    
    for(int i = 0; i < SIZE; ++i)
    {
        nodes[vec_nodes.back()->getID()] = vec_nodes.back();
        vec_nodes.pop_back();
    }

    return nodes;
}

void startSearch(Node** nodes, int startID, int endID)
{
    int d = nodes[0]->getLine();
    int start = startID;
    int end = endID;
    Node* cur_node = nodes[start];
    int cur_f;
    int cur_g;
    int succ_f;
    Node* succ_node;
    int minF;
    while(cur_node->getID() != end)
    {
        cur_f = cur_node->getF();
        cur_g = cur_node->getG();
        for(int i = 0; i < cur_node->getSize(); ++i)
        {
            succ_node = nodes[cur_node->getSucc(i)];
            succ_f = cur_g + cur_node->getSuccDist(i) + succ_node->getLine();
            if(succ_node->getF() > succ_f)
            {
                succ_node->setG(cur_g + cur_node->getSuccDist(i));
                succ_node->setF(succ_f);
            }
        }
        cur_node->setF(1024);    
        minF = nodes[0]->getF();
        for(int i = 0; i < SIZE; ++ i)
        {
            if(nodes[i]->getF() < minF)
            {
                cur_node = nodes[i]; 
                minF = cur_node->getF();
            }
        }
    }
    
    printf("\nPath length = %d.\n", cur_node->getG());
}

int main()
{
    Node** nodes;

    nodes = init();

    printf("\n-----------------Init Finished------------------\n");

#ifdef DUMP
    m5_dump_stats(0, 0);
    m5_reset_stats(0, 0);
#endif

    startSearch(nodes, 0, 4);

#ifdef DUMP
    m5_dump_stats(0, 0);
    m5_reset_stats(0, 0);
#endif

    printf("\n-----------------All Finished------------------\n");
    return 0;
}
