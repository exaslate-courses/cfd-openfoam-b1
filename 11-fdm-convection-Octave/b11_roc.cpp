#include <iostream>
#include <vector>
#include <cmath>

std::vector<float> compute_rate_of_convergence(std::vector<float> errors, std::vector<float> dx) {
    std::vector<float> roc;

    for (int i = 0; i < errors.size()-1; ++i)  {
        float r = log(errors[i]/errors[i+1])/log(dx[i]/dx[i+1]);

        roc.push_back(r);
    }

    return roc;
}

int main()
{
    std::vector<float> errors({0.16, 0.0775, 0.038125});
    std::vector<float> dx({0.1, 0.05, 0.025});

    std::vector<float> roc = compute_rate_of_convergence(errors, dx);

    for (int i = 0; i < roc.size(); ++i) {
        std::cout << roc[i] << std::endl;
    }

    return 0;
}