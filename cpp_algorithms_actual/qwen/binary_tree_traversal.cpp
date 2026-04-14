#include <iostream>
#include <vector>
using namespace std;

struct Node { int val; Node* left, *right; Node(int v) : val(v), left(nullptr), right(nullptr) {} };

void preOrder(Node* root) {
    if (!root) return;
    cout << root->val << " ";
    preOrder(root->left);
    preOrder(root->right);
}

void inOrder(Node* root) {
    if (!root) return;
    inOrder(root->left);
    cout << root->val << " ";
    inOrder(root->right);
}

void postOrder(Node* root) {
    if (!root) return;
    postOrder(root->left);
    postOrder(root->right);
    cout << root->val << " ";
}

Node* createTree() {
    Node* root = new Node(1);
    root->left = new Node(2);
    root->right = new Node(3);
    root->left->left = new Node(4);
    root->left->right = new Node(5);
    root->right->left = new Node(6);
    root->right->right = new Node(7);
    return root;
}

int main() {
    Node* root = createTree();
    cout << "Pre-order: "; preOrder(root); cout << endl;
    cout << "In-order: "; inOrder(root); cout << endl;
    cout << "Post-order: "; postOrder(root); cout << endl;
    return 0;
}