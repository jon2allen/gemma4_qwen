#include <iostream>
#include <vector>
#include <cmath>
#include <algorithm>
using namespace std;

struct Point { double x, y; };

double distance(const Point& a, const Point& b) {
    return sqrt(pow(a.x - b.x, 2) + pow(a.y - b.y, 2));
}

vector<Point> kMeans(vector<Point>& data, int k) {
    vector<vector<Point>> clusters(k);
    vector<Point> centroids(k);
    for (int i = 0; i < k; i++) centroids[i] = data[i];
    for (int iter = 0; iter < 10; iter++) {
        for (int i = 0; i < data.size(); i++) {
            double minDist = 1e9;
            int cluster = 0;
            for (int j = 0; j < k; j++) {
                double d = distance(data[i], centroids[j]);
                if (d < minDist) { minDist = d; cluster = j; }
            }
            clusters[cluster].push_back(data[i]);
        }
        for (int j = 0; j < k; j++) {
            if (clusters[j].empty()) continue;
            double sumX = 0, sumY = 0;
            for (const auto& p : clusters[j]) {
                sumX += p.x; sumY += p.y;
            }
            centroids[j] = {sumX / clusters[j].size(), sumY / clusters[j].size()};
        }
    }
    return centroids;
}

int main() {
    vector<Point> data = {{1, 2}, {5, 6}, {3, 4}, {7, 8}, {2, 3}};
    vector<Point> centroids = kMeans(data, 2);
    for (const auto& c : centroids) cout << "(" << c.x << ", " << c.y << ") ";
    return 0;
}