#include<iostream>
#include<cstdlib>
#define MAX_SIZE 1024
using namespace std;
class Queue{
    private:
        unsigned int item[MAX_SIZE][4];
        int rear;
        int front;
    public:
        Queue();
        void enqueue(unsigned int,unsigned int,unsigned int,unsigned int);
        void dequeue(unsigned int&,unsigned int&,unsigned int&,unsigned int&);
        int size();
        void display();
        bool isEmpty();
        bool isFull();
};
Queue::Queue(){
    rear = -1;
    front = 0;
}
void Queue::enqueue(unsigned int data0,unsigned int data1, unsigned int data2, unsigned int data3){
        item[++rear][0] = data0;
	item[rear][1] = data1;
	item[rear][2] = data2;
	item[rear][3] = data3;
}
void Queue::dequeue(unsigned int& data0,unsigned int& data1,unsigned int& data2,unsigned int& data3){

	//if(this->isEmpty())
		//return NULL;
	data0 = item[front][0];
	data1 = item[front][1];
	data2 = item[front][2];
	data3 = item[front++][3];
        //return item[front++];
}
void Queue::display(){
    if(!this->isEmpty()){
        for(int i=front; i<=rear; i++)
            cout<<item[i]<<endl;
    }else{
        cout<<"Queue Underflow"<<endl;
    }
}
int Queue::size(){
    return (rear - front + 1);
}
bool Queue::isEmpty(){
    if(front>rear){
        return true;
    }else{
        return false;
    }
}
bool Queue::isFull(){
    if(this->size()>=MAX_SIZE){
        return true;
    }else{
        return false;
    }
}
/*
int main(){
    Queue queue;
    int choice, data;
    while(1){
        cout<<"\n1. Enqueue\n2. Dequeue\n3. Size\n4. Display all element\n5. Quit";
        cout<<"\nEnter your choice: ";
        cin>>choice;
        switch(choice){
            case 1:
            if(!queue.isFull()){
                    cout<<"\nEnter data: ";
                    cin>>data;
                    queue.enqueue(data);
            }else{
                cout<<"Queue is Full"<<endl;
            }
            break;
            case 2:
            if(!queue.isEmpty()){
                cout<<"The data dequeued is :"<<queue.dequeue();
            }else{
                cout<<"Queue is Emtpy"<<endl;
            }
                break;
            case 3:
                cout<<"Size of Queue is "<<queue.size();
                break;
            case 4:
                queue.display();
                break;
            case 5:
                exit(0);
                break;
        }
    }
    return 0;
}
*/
