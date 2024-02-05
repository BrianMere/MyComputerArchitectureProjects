
#ifndef __DATASET_H
#define __DATASET_H
#define ARRAY_SIZE 2500 


#define DIM_SIZE 50 


typedef int data_t;static data_t input1_data[ARRAY_SIZE] = 
{
    0,   3,   2,   0,   3,   1,   0,   3,   2,   3,   2,   0,   3,   3,   1,   2,   3,   0,   0,   1, 
    1,   1,   2,   3,   1,   2,   3,   1,   1,   3,   2,   2,   0,   1,   3,   2,   2,   2,   0,   0, 
    1,   0,   1,   3,   3,   0,   3,   3,   3,   3,   0,   3,   2,   1,   2,   2,   0,   0,   3,   0, 
    1,   1,   0,   3,   3,   1,   2,   3,   3,   0,   1,   2,   1,   0,   1,   2,   2,   1,   0,   3, 
    1,   0,   2,   2,   1,   1,   1,   1,   1,   1,   2,   0,   3,   1,   1,   2,   2,   3,   3,   1, 
    3,   2,   0,   0,   0,   3,   3,   3,   2,   1,   2,   3,   1,   0,   0,   0,   0,   1,   2,   2, 
    1,   1,   3,   3,   3,   1,   1,   2,   3,   1,   3,   3,   2,   3,   2,   1,   2,   3,   0,   2, 
    2,   1,   1,   0,   0,   0,   0,   0,   1,   3,   3,   1,   1,   1,   2,   2,   3,   2,   1,   1, 
    1,   1,   3,   0,   2,   2,   1,   3,   2,   1,   2,   2,   1,   3,   1,   3,   1,   3,   2,   3, 
    1,   2,   1,   3,   2,   2,   0,   1,   0,   0,   1,   2,   3,   3,   1,   0,   0,   0,   3,   1, 
    2,   3,   2,   3,   2,   0,   0,   0,   0,   0,   3,   1,   3,   0,   0,   0,   3,   1,   1,   1, 
    1,   2,   1,   2,   3,   2,   0,   0,   2,   2,   3,   0,   3,   0,   0,   3,   0,   3,   1,   3, 
    3,   1,   1,   1,   2,   2,   1,   3,   0,   3,   3,   1,   0,   0,   3,   2,   1,   3,   3,   3, 
    1,   0,   1,   1,   2,   1,   0,   1,   1,   2,   2,   3,   1,   2,   2,   2,   0,   1,   3,   3, 
    3,   2,   2,   1,   0,   1,   2,   0,   1,   1,   1,   1,   2,   3,   2,   2,   3,   3,   0,   0, 
    2,   0,   0,   0,   3,   0,   1,   0,   3,   0,   0,   0,   3,   0,   0,   2,   0,   2,   0,   0, 
    2,   3,   2,   0,   0,   3,   3,   2,   1,   1,   0,   2,   0,   0,   3,   3,   2,   3,   3,   0, 
    1,   0,   2,   2,   0,   3,   3,   1,   1,   0,   2,   3,   2,   1,   1,   0,   1,   2,   1,   2, 
    2,   0,   0,   1,   0,   1,   1,   0,   1,   0,   2,   3,   3,   2,   0,   0,   1,   3,   0,   3, 
    3,   0,   0,   0,   0,   3,   3,   1,   0,   0,   3,   3,   2,   1,   2,   1,   3,   3,   0,   1, 
    3,   0,   2,   3,   1,   3,   3,   3,   3,   3,   0,   1,   1,   3,   0,   2,   2,   3,   1,   2, 
    2,   2,   1,   3,   3,   0,   3,   0,   0,   2,   0,   2,   3,   0,   1,   3,   2,   2,   0,   0, 
    2,   3,   0,   2,   2,   2,   3,   1,   0,   3,   3,   3,   3,   1,   0,   3,   3,   2,   0,   3, 
    2,   0,   3,   0,   2,   0,   0,   2,   2,   1,   0,   2,   3,   1,   1,   1,   1,   2,   3,   3, 
    3,   0,   0,   3,   3,   3,   2,   3,   3,   1,   2,   2,   3,   1,   2,   1,   1,   3,   0,   1, 
    2,   0,   2,   0,   0,   1,   3,   2,   0,   1,   3,   2,   3,   3,   0,   0,   0,   1,   0,   3, 
    3,   2,   2,   2,   1,   1,   2,   2,   1,   3,   2,   0,   1,   3,   2,   0,   2,   1,   3,   0, 
    0,   0,   1,   3,   3,   2,   2,   2,   3,   1,   0,   0,   1,   1,   2,   1,   3,   1,   1,   2, 
    2,   3,   2,   3,   0,   2,   3,   3,   0,   3,   0,   0,   1,   0,   0,   0,   1,   3,   1,   1, 
    2,   3,   2,   1,   1,   2,   2,   2,   3,   0,   1,   1,   2,   1,   2,   0,   2,   3,   1,   3, 
    0,   1,   1,   3,   0,   2,   3,   0,   1,   2,   3,   2,   0,   0,   3,   3,   2,   1,   1,   2, 
    3,   0,   1,   1,   1,   1,   2,   0,   1,   2,   0,   1,   1,   1,   0,   1,   3,   2,   3,   1, 
    0,   2,   1,   2,   1,   3,   3,   1,   0,   2,   2,   3,   1,   3,   1,   3,   0,   1,   0,   3, 
    0,   3,   2,   0,   3,   3,   3,   0,   3,   2,   2,   2,   1,   3,   0,   0,   1,   1,   3,   0, 
    1,   2,   1,   0,   0,   0,   3,   2,   2,   0,   0,   2,   1,   3,   0,   0,   3,   0,   0,   2, 
    1,   1,   2,   2,   1,   3,   2,   2,   1,   1,   2,   1,   3,   2,   1,   1,   3,   0,   1,   3, 
    3,   2,   2,   1,   0,   3,   2,   2,   2,   3,   0,   1,   3,   3,   2,   3,   0,   3,   2,   3, 
    1,   1,   0,   0,   0,   2,   3,   0,   3,   0,   1,   1,   3,   1,   3,   2,   1,   1,   2,   1, 
    3,   2,   0,   2,   1,   0,   2,   3,   2,   3,   2,   1,   2,   3,   0,   0,   1,   1,   0,   0, 
    2,   1,   0,   1,   2,   2,   2,   2,   0,   3,   3,   1,   0,   0,   0,   0,   3,   1,   1,   0, 
    0,   0,   0,   1,   2,   2,   1,   3,   0,   2,   3,   2,   3,   2,   2,   1,   2,   2,   3,   3, 
    1,   3,   0,   2,   2,   3,   3,   1,   2,   2,   2,   3,   1,   1,   1,   0,   0,   0,   3,   0, 
    1,   0,   3,   1,   1,   3,   0,   1,   2,   2,   0,   0,   3,   3,   3,   3,   2,   1,   0,   0, 
    1,   0,   2,   0,   1,   1,   0,   0,   3,   3,   2,   1,   1,   1,   0,   1,   1,   2,   2,   1, 
    1,   2,   0,   3,   1,   3,   1,   0,   3,   0,   3,   1,   1,   1,   0,   2,   0,   3,   1,   0, 
    1,   0,   2,   0,   2,   3,   3,   3,   1,   2,   3,   2,   2,   0,   1,   1,   0,   3,   3,   1, 
    3,   3,   2,   0,   2,   0,   2,   2,   3,   3,   3,   0,   2,   3,   3,   1,   3,   2,   2,   2, 
    0,   2,   3,   0,   2,   0,   3,   2,   2,   1,   1,   0,   2,   2,   2,   0,   2,   2,   0,   1, 
    3,   2,   1,   3,   2,   2,   0,   3,   3,   1,   2,   2,   0,   0,   3,   2,   1,   2,   2,   1, 
    3,   1,   2,   0,   0,   1,   1,   2,   1,   3,   2,   2,   3,   0,   2,   1,   3,   2,   1,   3, 
    2,   3,   3,   1,   2,   1,   2,   2,   0,   0,   0,   3,   0,   2,   3,   1,   0,   0,   2,   3, 
    3,   2,   2,   1,   3,   3,   2,   2,   2,   1,   1,   3,   3,   3,   0,   1,   1,   2,   1,   1, 
    1,   0,   2,   1,   2,   0,   2,   1,   2,   3,   1,   1,   0,   0,   3,   0,   2,   0,   2,   3, 
    1,   1,   0,   3,   1,   0,   3,   1,   3,   1,   2,   0,   1,   2,   3,   2,   3,   0,   2,   1, 
    0,   1,   1,   3,   0,   0,   1,   0,   2,   1,   1,   0,   2,   2,   3,   0,   2,   0,   1,   2, 
    0,   1,   3,   0,   0,   3,   1,   3,   0,   0,   3,   1,   0,   2,   2,   3,   3,   2,   0,   2, 
    0,   3,   1,   2,   0,   0,   0,   2,   1,   1,   1,   2,   2,   3,   3,   3,   0,   3,   0,   3, 
    3,   1,   3,   3,   0,   3,   3,   2,   2,   3,   0,   3,   0,   2,   3,   3,   3,   1,   1,   3, 
    1,   0,   3,   3,   2,   0,   1,   3,   2,   0,   1,   1,   3,   2,   1,   3,   1,   2,   0,   0, 
    1,   1,   0,   0,   0,   1,   1,   3,   1,   2,   2,   2,   3,   1,   1,   0,   0,   2,   3,   3, 
    2,   1,   3,   0,   0,   3,   0,   2,   3,   1,   0,   0,   0,   1,   3,   3,   3,   0,   3,   3, 
    2,   1,   0,   1,   1,   2,   3,   0,   2,   1,   3,   1,   1,   2,   2,   2,   1,   3,   2,   0, 
    2,   3,   2,   1,   2,   3,   0,   3,   1,   3,   2,   3,   2,   2,   3,   2,   3,   3,   0,   1, 
    0,   3,   2,   1,   1,   3,   2,   0,   1,   1,   3,   3,   2,   3,   2,   2,   1,   1,   1,   3, 
    3,   3,   2,   1,   1,   0,   1,   2,   3,   3,   1,   3,   1,   0,   0,   3,   3,   2,   3,   1, 
    3,   1,   0,   1,   3,   1,   0,   0,   0,   2,   0,   2,   1,   3,   2,   3,   2,   1,   0,   1, 
    3,   2,   0,   0,   2,   3,   0,   2,   0,   1,   0,   1,   2,   1,   3,   2,   2,   1,   3,   3, 
    2,   1,   0,   1,   0,   0,   0,   2,   1,   2,   2,   0,   0,   0,   2,   3,   1,   2,   1,   2, 
    1,   3,   2,   2,   3,   2,   3,   1,   0,   0,   2,   1,   2,   3,   1,   3,   2,   0,   0,   1, 
    2,   1,   0,   3,   2,   2,   0,   1,   2,   3,   2,   2,   2,   0,   0,   0,   3,   1,   1,   3, 
    1,   0,   2,   1,   2,   0,   1,   1,   3,   3,   2,   2,   1,   2,   1,   2,   1,   1,   2,   2, 
    1,   2,   1,   1,   1,   1,   2,   2,   3,   2,   0,   1,   3,   0,   1,   3,   1,   0,   3,   0, 
    2,   2,   1,   2,   2,   3,   2,   0,   3,   3,   1,   0,   2,   2,   1,   2,   2,   0,   2,   2, 
    2,   3,   0,   2,   1,   2,   1,   2,   1,   2,   0,   1,   3,   0,   3,   3,   3,   1,   1,   2, 
    3,   1,   2,   0,   0,   2,   2,   0,   1,   1,   3,   2,   2,   2,   2,   2,   3,   1,   1,   3, 
    3,   2,   0,   3,   3,   3,   1,   3,   3,   0,   1,   2,   0,   2,   1,   0,   2,   2,   2,   0, 
    2,   0,   1,   0,   3,   2,   2,   2,   0,   2,   1,   2,   2,   2,   1,   0,   0,   2,   0,   1, 
    2,   3,   1,   3,   0,   1,   2,   0,   2,   1,   3,   1,   1,   0,   0,   1,   3,   0,   3,   1, 
    1,   3,   3,   0,   0,   2,   1,   1,   3,   0,   2,   3,   1,   2,   0,   2,   3,   1,   2,   3, 
    2,   0,   0,   1,   3,   2,   3,   1,   1,   0,   2,   1,   2,   3,   1,   2,   3,   3,   2,   2, 
    2,   3,   0,   0,   2,   0,   2,   0,   0,   2,   3,   0,   3,   3,   2,   0,   1,   2,   2,   2, 
    1,   1,   2,   3,   0,   0,   2,   3,   3,   3,   0,   2,   0,   2,   1,   2,   3,   1,   3,   1, 
    2,   2,   3,   0,   1,   0,   2,   3,   0,   3,   0,   0,   1,   2,   2,   3,   1,   1,   3,   3, 
    2,   2,   0,   2,   2,   1,   3,   3,   2,   3,   2,   2,   2,   0,   2,   0,   0,   1,   2,   3, 
    2,   0,   1,   0,   0,   0,   1,   3,   3,   0,   1,   1,   1,   1,   0,   3,   1,   1,   3,   3, 
    1,   3,   0,   3,   0,   0,   0,   3,   1,   0,   2,   2,   3,   1,   2,   0,   2,   0,   2,   3, 
    2,   2,   1,   3,   3,   0,   3,   0,   3,   3,   3,   2,   0,   0,   0,   2,   0,   2,   3,   0, 
    2,   2,   1,   1,   3,   0,   0,   0,   0,   0,   2,   0,   2,   2,   1,   2,   2,   2,   3,   3, 
    3,   0,   1,   2,   2,   2,   2,   2,   0,   3,   2,   1,   3,   0,   1,   2,   0,   0,   0,   1, 
    0,   0,   0,   3,   1,   2,   0,   2,   0,   3,   3,   3,   0,   0,   3,   1,   2,   1,   1,   3, 
    3,   0,   2,   0,   0,   2,   3,   0,   2,   2,   1,   3,   2,   1,   3,   1,   3,   2,   0,   2, 
    1,   0,   3,   0,   1,   0,   0,   2,   1,   3,   2,   1,   2,   0,   3,   1,   2,   2,   0,   3, 
    2,   3,   0,   2,   2,   2,   1,   1,   0,   1,   1,   2,   0,   1,   0,   2,   3,   0,   2,   1, 
    3,   2,   1,   1,   3,   2,   1,   2,   2,   0,   1,   3,   3,   3,   0,   1,   1,   2,   2,   3, 
    3,   1,   1,   3,   1,   2,   3,   1,   0,   2,   3,   3,   0,   3,   0,   3,   3,   2,   0,   0, 
    1,   2,   0,   0,   0,   0,   2,   1,   3,   2,   0,   2,   0,   1,   2,   1,   3,   1,   1,   2, 
    1,   0,   3,   0,   2,   1,   2,   2,   0,   0,   0,   0,   0,   0,   1,   0,   1,   3,   1,   1, 
    3,   1,   0,   3,   1,   2,   0,   0,   0,   1,   0,   2,   2,   2,   1,   3,   0,   2,   3,   1, 
    3,   0,   3,   0,   1,   3,   3,   1,   3,   1,   2,   1,   0,   1,   0,   1,   0,   0,   2,   3, 
    2,   3,   2,   1,   3,   0,   1,   3,   1,   0,   1,   0,   2,   2,   1,   3,   1,   3,   3,   0, 
    0,   2,   3,   2,   2,   1,   3,   1,   1,   0,   2,   2,   1,   2,   1,   1,   1,   1,   2,   0, 
    0,   2,   3,   2,   3,   3,   2,   2,   1,   3,   3,   3,   1,   2,   2,   2,   3,   3,   0,   1, 
    0,   3,   0,   0,   3,   3,   1,   0,   3,   0,   2,   0,   1,   1,   1,   1,   1,   0,   1,   0, 
    3,   1,   0,   1,   3,   0,   3,   0,   3,   2,   2,   1,   1,   1,   2,   3,   1,   1,   1,   1, 
    0,   3,   2,   3,   0,   3,   2,   1,   0,   0,   0,   2,   0,   3,   2,   2,   0,   0,   0,   3, 
    0,   1,   2,   3,   0,   2,   1,   0,   3,   1,   1,   0,   3,   1,   1,   3,   0,   1,   2,   3, 
    0,   2,   2,   2,   1,   0,   2,   0,   3,   3,   3,   3,   1,   2,   3,   0,   3,   2,   0,   1, 
    2,   2,   3,   0,   1,   3,   1,   0,   1,   0,   3,   0,   2,   2,   3,   0,   0,   0,   2,   1, 
    3,   3,   1,   1,   1,   2,   2,   1,   3,   1,   2,   2,   2,   2,   0,   0,   3,   1,   2,   2, 
    2,   0,   3,   2,   3,   0,   2,   0,   0,   0,   1,   3,   2,   0,   1,   0,   2,   1,   2,   2, 
    1,   2,   0,   0,   3,   1,   2,   0,   1,   2,   1,   0,   0,   3,   2,   1,   3,   3,   2,   1, 
    1,   3,   1,   0,   1,   1,   1,   3,   2,   3,   2,   2,   2,   1,   0,   2,   1,   3,   1,   0, 
    3,   1,   3,   0,   0,   2,   3,   1,   2,   1,   0,   0,   3,   3,   3,   3,   1,   1,   3,   0, 
    2,   0,   3,   2,   3,   0,   1,   2,   2,   3,   1,   0,   0,   1,   3,   3,   2,   0,   3,   2, 
    3,   3,   2,   2,   3,   0,   1,   0,   0,   3,   0,   2,   3,   3,   3,   1,   3,   0,   0,   2, 
    1,   1,   2,   1,   0,   1,   2,   1,   3,   3,   0,   0,   2,   0,   3,   2,   1,   2,   1,   3, 
    0,   2,   2,   0,   3,   0,   2,   3,   0,   0,   3,   1,   1,   3,   3,   0,   1,   0,   0,   3, 
    3,   0,   3,   3,   0,   3,   0,   1,   3,   1,   1,   3,   3,   3,   0,   0,   3,   2,   3,   0, 
    0,   2,   1,   1,   3,   2,   1,   0,   1,   1,   2,   0,   0,   1,   2,   3,   0,   3,   2,   3, 
    1,   3,   0,   3,   2,   2,   0,   3,   1,   2,   1,   1,   1,   0,   3,   0,   1,   2,   0,   2, 
    1,   3,   2,   3,   1,   2,   2,   0,   2,   2,   1,   1,   2,   0,   1,   2,   1,   0,   2,   0, 
    2,   1,   0,   1,   1,   2,   0,   2,   3,   0,   2,   2,   0,   2,   2,   1,   2,   2,   3,   3, 
    2,   2,   2,   1,   1,   0,   1,   3,   1,   1,   2,   2,   1,   2,   0,   0,   0,   1,   0,   2, 
    2,   0,   2,   3,   2,   3,   1,   1,   1,   3,   2,   0,   0,   0,   1,   3,   3,   2,   1,   1, 
    3,   2,   3,   1,   2,   1,   2,   1,   2,   1,   3,   2,   3,   2,   3,   3,   2,   1,   3,   0
};

static data_t input2_data[ARRAY_SIZE] = 
{
    1,   1,   0,   3,   1,   2,   0,   0,   0,   0,   0,   2,   1,   2,   3,   0,   0,   3,   3,   2, 
    2,   1,   2,   3,   3,   0,   2,   2,   1,   1,   2,   2,   0,   2,   2,   1,   2,   3,   2,   2, 
    3,   3,   2,   2,   1,   1,   1,   1,   2,   1,   2,   2,   3,   3,   3,   0,   0,   3,   2,   3, 
    2,   3,   1,   2,   1,   1,   2,   2,   0,   1,   0,   3,   2,   1,   1,   1,   2,   0,   1,   2, 
    2,   0,   2,   1,   3,   3,   2,   3,   2,   0,   3,   1,   3,   3,   2,   0,   1,   0,   1,   1, 
    2,   2,   1,   1,   2,   2,   1,   2,   3,   3,   1,   3,   2,   2,   2,   3,   3,   1,   0,   2, 
    1,   0,   0,   0,   1,   1,   2,   0,   3,   2,   3,   3,   0,   2,   3,   1,   0,   0,   2,   1, 
    2,   0,   2,   1,   1,   2,   3,   1,   3,   2,   1,   0,   0,   0,   0,   0,   2,   2,   0,   2, 
    1,   2,   0,   3,   2,   2,   0,   0,   3,   2,   1,   1,   3,   0,   2,   0,   0,   1,   0,   2, 
    3,   3,   1,   3,   3,   0,   0,   2,   2,   0,   0,   0,   1,   0,   0,   1,   3,   0,   2,   1, 
    3,   2,   2,   1,   3,   2,   0,   1,   2,   2,   3,   2,   1,   1,   1,   1,   3,   0,   1,   3, 
    2,   2,   3,   1,   1,   2,   0,   2,   1,   1,   2,   3,   1,   0,   1,   0,   1,   1,   0,   0, 
    2,   0,   3,   0,   3,   0,   3,   2,   2,   3,   3,   2,   1,   0,   2,   2,   1,   1,   0,   3, 
    3,   2,   2,   0,   0,   3,   0,   1,   0,   0,   1,   2,   0,   1,   3,   0,   1,   2,   2,   0, 
    0,   3,   0,   3,   0,   1,   1,   2,   0,   0,   0,   3,   0,   0,   2,   1,   1,   1,   0,   2, 
    1,   3,   1,   2,   0,   3,   0,   3,   1,   3,   0,   0,   2,   2,   2,   2,   3,   3,   2,   1, 
    2,   2,   1,   1,   2,   2,   2,   2,   0,   3,   0,   0,   2,   0,   1,   2,   0,   3,   2,   3, 
    2,   0,   2,   1,   2,   1,   0,   2,   1,   1,   3,   2,   2,   3,   1,   0,   3,   3,   1,   0, 
    3,   2,   2,   0,   0,   3,   0,   0,   2,   0,   3,   2,   3,   1,   1,   0,   0,   2,   3,   0, 
    0,   1,   1,   1,   2,   1,   3,   2,   1,   3,   0,   1,   3,   3,   1,   1,   1,   1,   1,   1, 
    0,   0,   2,   3,   2,   2,   2,   3,   2,   3,   1,   2,   3,   2,   2,   2,   0,   1,   3,   0, 
    1,   1,   0,   1,   0,   1,   1,   3,   3,   1,   2,   2,   3,   2,   0,   2,   2,   0,   1,   3, 
    0,   1,   3,   2,   1,   3,   3,   2,   0,   1,   3,   2,   0,   2,   1,   1,   0,   3,   0,   1, 
    1,   1,   1,   1,   3,   0,   0,   1,   0,   2,   3,   1,   3,   0,   2,   1,   3,   0,   3,   0, 
    3,   2,   2,   0,   0,   2,   1,   3,   3,   2,   3,   2,   2,   1,   2,   2,   3,   0,   3,   2, 
    2,   0,   3,   2,   3,   2,   0,   0,   1,   2,   0,   0,   2,   0,   0,   3,   3,   2,   0,   0, 
    3,   3,   0,   2,   3,   1,   0,   1,   0,   2,   1,   0,   2,   1,   0,   1,   0,   3,   0,   2, 
    2,   3,   0,   0,   2,   1,   0,   1,   0,   0,   0,   2,   2,   3,   2,   0,   3,   3,   2,   1, 
    0,   0,   3,   1,   2,   3,   3,   1,   0,   3,   1,   1,   0,   3,   3,   3,   2,   2,   2,   0, 
    1,   2,   0,   3,   0,   1,   0,   1,   1,   0,   1,   2,   0,   3,   2,   0,   1,   2,   2,   0, 
    2,   0,   0,   1,   0,   3,   0,   3,   2,   1,   1,   1,   1,   3,   2,   1,   1,   1,   1,   0, 
    2,   1,   1,   3,   2,   0,   2,   1,   1,   0,   2,   2,   1,   3,   0,   2,   1,   0,   1,   2, 
    0,   1,   3,   2,   3,   2,   1,   0,   2,   0,   2,   2,   3,   1,   1,   3,   2,   3,   2,   2, 
    0,   2,   0,   0,   0,   3,   2,   0,   2,   2,   3,   3,   3,   2,   1,   2,   0,   0,   3,   0, 
    2,   0,   3,   2,   2,   3,   0,   3,   2,   1,   2,   2,   1,   2,   0,   0,   3,   1,   2,   0, 
    2,   3,   2,   2,   1,   1,   1,   3,   3,   3,   3,   3,   1,   3,   0,   1,   3,   2,   2,   1, 
    0,   1,   1,   2,   1,   2,   3,   1,   2,   2,   1,   2,   1,   1,   0,   3,   3,   1,   1,   3, 
    2,   0,   0,   1,   2,   0,   1,   3,   1,   0,   0,   2,   2,   3,   3,   0,   2,   3,   2,   1, 
    1,   3,   0,   2,   2,   3,   3,   1,   2,   3,   3,   3,   1,   3,   0,   3,   1,   1,   2,   2, 
    2,   1,   0,   3,   2,   3,   0,   2,   3,   2,   3,   1,   2,   3,   3,   1,   2,   1,   0,   0, 
    0,   3,   3,   3,   3,   0,   3,   3,   3,   3,   2,   1,   0,   3,   0,   3,   2,   3,   1,   0, 
    0,   1,   3,   1,   0,   2,   2,   3,   1,   0,   2,   1,   1,   3,   1,   1,   3,   1,   2,   1, 
    0,   0,   3,   2,   1,   1,   1,   1,   3,   2,   1,   3,   3,   1,   0,   3,   1,   1,   2,   0, 
    0,   0,   2,   3,   3,   2,   2,   3,   0,   2,   3,   1,   3,   3,   0,   2,   1,   2,   2,   2, 
    1,   0,   1,   3,   2,   3,   1,   1,   2,   1,   1,   0,   0,   2,   3,   2,   1,   0,   3,   1, 
    3,   0,   1,   1,   2,   2,   1,   3,   3,   1,   1,   0,   0,   3,   3,   0,   0,   0,   0,   0, 
    3,   1,   3,   0,   0,   0,   3,   3,   2,   1,   3,   0,   1,   3,   1,   1,   1,   0,   1,   0, 
    1,   2,   2,   2,   3,   3,   0,   2,   3,   2,   1,   3,   3,   1,   1,   3,   0,   3,   3,   2, 
    1,   1,   2,   0,   3,   0,   1,   2,   1,   1,   0,   0,   1,   2,   2,   0,   3,   1,   1,   1, 
    3,   3,   3,   1,   0,   3,   3,   2,   2,   2,   1,   2,   0,   1,   1,   3,   0,   3,   1,   0, 
    2,   2,   0,   1,   2,   3,   2,   1,   2,   0,   3,   2,   1,   3,   0,   1,   2,   0,   3,   0, 
    1,   1,   2,   1,   3,   2,   3,   0,   2,   1,   1,   3,   0,   2,   3,   2,   1,   3,   2,   2, 
    3,   2,   1,   2,   3,   0,   3,   0,   2,   1,   3,   1,   2,   1,   0,   2,   0,   1,   2,   2, 
    0,   1,   1,   2,   0,   2,   0,   0,   2,   1,   3,   1,   1,   0,   3,   1,   2,   1,   3,   2, 
    2,   3,   3,   1,   0,   1,   3,   1,   1,   3,   1,   2,   1,   0,   1,   2,   0,   3,   1,   3, 
    3,   2,   0,   2,   0,   2,   3,   0,   0,   1,   2,   2,   0,   0,   0,   1,   2,   2,   1,   3, 
    0,   2,   1,   0,   3,   0,   3,   1,   0,   0,   0,   3,   0,   3,   2,   1,   0,   3,   3,   3, 
    2,   1,   3,   3,   1,   2,   1,   1,   0,   2,   0,   0,   2,   2,   2,   0,   0,   0,   3,   3, 
    0,   1,   2,   1,   1,   1,   1,   1,   2,   1,   1,   2,   3,   0,   2,   2,   0,   1,   0,   0, 
    1,   0,   1,   1,   3,   3,   2,   0,   0,   3,   3,   1,   3,   0,   2,   0,   1,   1,   0,   0, 
    0,   3,   0,   2,   1,   2,   1,   0,   0,   2,   3,   1,   1,   0,   2,   3,   2,   0,   1,   1, 
    0,   3,   0,   2,   0,   1,   0,   1,   0,   2,   2,   0,   3,   3,   2,   1,   0,   3,   0,   1, 
    1,   0,   1,   0,   3,   1,   2,   0,   0,   1,   1,   0,   1,   0,   1,   2,   2,   0,   3,   0, 
    0,   3,   0,   3,   2,   2,   1,   0,   0,   3,   3,   3,   0,   1,   1,   0,   0,   1,   2,   0, 
    2,   1,   3,   0,   3,   3,   3,   2,   1,   0,   1,   2,   3,   1,   1,   3,   2,   3,   0,   2, 
    3,   3,   0,   1,   0,   3,   2,   3,   0,   2,   1,   3,   1,   1,   1,   1,   0,   3,   3,   0, 
    1,   3,   3,   2,   2,   3,   2,   0,   2,   1,   3,   0,   0,   3,   2,   3,   2,   1,   2,   3, 
    1,   1,   1,   3,   2,   0,   1,   0,   0,   3,   3,   3,   3,   0,   2,   3,   1,   0,   3,   1, 
    3,   1,   1,   0,   0,   2,   1,   2,   2,   1,   2,   0,   3,   0,   3,   0,   3,   3,   2,   3, 
    2,   3,   1,   1,   2,   3,   3,   3,   0,   1,   3,   0,   1,   2,   0,   1,   3,   2,   2,   2, 
    2,   1,   3,   3,   2,   3,   3,   0,   3,   3,   3,   3,   0,   1,   2,   0,   3,   0,   0,   1, 
    0,   3,   0,   1,   1,   2,   0,   1,   0,   2,   0,   1,   0,   0,   0,   3,   3,   3,   3,   2, 
    0,   2,   1,   1,   0,   1,   0,   3,   2,   0,   0,   1,   0,   3,   0,   0,   1,   0,   1,   3, 
    2,   2,   1,   3,   0,   1,   0,   1,   2,   2,   3,   0,   2,   1,   2,   1,   0,   1,   2,   0, 
    2,   1,   1,   1,   2,   0,   1,   0,   1,   3,   2,   3,   0,   0,   2,   3,   1,   0,   2,   0, 
    3,   2,   3,   3,   0,   3,   0,   2,   0,   0,   1,   2,   3,   3,   2,   2,   0,   0,   0,   0, 
    1,   1,   3,   3,   2,   1,   3,   1,   0,   3,   1,   2,   2,   3,   0,   3,   1,   1,   2,   2, 
    0,   3,   2,   2,   0,   2,   3,   3,   2,   3,   0,   0,   3,   2,   2,   0,   1,   2,   3,   3, 
    2,   3,   1,   1,   1,   0,   2,   3,   2,   3,   1,   0,   2,   2,   0,   2,   3,   1,   3,   1, 
    3,   0,   0,   2,   0,   3,   1,   3,   1,   2,   0,   3,   3,   1,   0,   1,   1,   0,   0,   3, 
    1,   1,   3,   2,   0,   3,   2,   2,   0,   1,   1,   0,   2,   0,   3,   2,   0,   0,   2,   2, 
    0,   1,   1,   3,   1,   1,   3,   3,   1,   3,   1,   0,   2,   2,   2,   1,   2,   0,   2,   1, 
    0,   3,   3,   1,   0,   0,   1,   3,   0,   0,   1,   2,   1,   1,   0,   2,   0,   0,   1,   0, 
    0,   2,   2,   2,   3,   2,   1,   3,   1,   0,   3,   0,   3,   1,   1,   2,   0,   1,   2,   0, 
    3,   2,   2,   3,   2,   2,   1,   3,   1,   0,   0,   3,   2,   2,   0,   2,   2,   1,   0,   3, 
    3,   2,   1,   0,   1,   1,   1,   2,   2,   1,   1,   0,   2,   0,   1,   0,   2,   0,   1,   2, 
    1,   3,   3,   0,   1,   0,   2,   3,   0,   2,   3,   3,   1,   3,   0,   1,   1,   2,   3,   0, 
    3,   0,   0,   1,   0,   3,   1,   2,   1,   2,   2,   0,   1,   1,   3,   0,   3,   3,   1,   3, 
    0,   3,   0,   2,   1,   0,   2,   2,   0,   0,   0,   3,   2,   3,   2,   1,   2,   3,   3,   2, 
    3,   3,   3,   3,   2,   3,   2,   1,   1,   2,   1,   0,   0,   0,   3,   3,   2,   3,   0,   1, 
    0,   2,   1,   2,   2,   3,   2,   3,   2,   0,   3,   2,   1,   0,   0,   2,   0,   3,   2,   3, 
    0,   1,   1,   2,   0,   0,   3,   2,   2,   2,   0,   3,   0,   1,   2,   2,   2,   2,   3,   2, 
    1,   2,   3,   3,   0,   3,   3,   2,   0,   1,   2,   3,   0,   1,   0,   3,   2,   3,   0,   1, 
    0,   1,   3,   2,   0,   1,   3,   0,   0,   2,   3,   3,   1,   3,   3,   3,   0,   2,   3,   0, 
    3,   1,   0,   1,   0,   1,   1,   2,   3,   2,   3,   3,   3,   3,   0,   3,   2,   1,   3,   1, 
    2,   0,   1,   3,   1,   0,   2,   0,   3,   1,   3,   0,   1,   2,   2,   2,   1,   0,   2,   3, 
    1,   3,   1,   2,   0,   2,   0,   3,   3,   2,   0,   3,   3,   1,   0,   0,   3,   0,   0,   0, 
    1,   3,   0,   2,   2,   1,   0,   2,   3,   0,   2,   1,   2,   0,   3,   2,   3,   2,   2,   0, 
    3,   0,   1,   0,   0,   2,   0,   3,   1,   1,   2,   2,   0,   3,   1,   3,   3,   0,   2,   2, 
    3,   1,   1,   0,   2,   2,   2,   0,   2,   3,   0,   2,   0,   3,   1,   1,   2,   1,   3,   1, 
    1,   3,   3,   1,   0,   3,   3,   1,   1,   1,   2,   3,   0,   3,   1,   3,   1,   3,   3,   1, 
    1,   3,   0,   0,   0,   0,   3,   2,   2,   1,   3,   0,   3,   2,   3,   3,   1,   3,   2,   3, 
    0,   1,   2,   0,   2,   1,   1,   0,   1,   1,   1,   3,   0,   1,   2,   3,   0,   0,   2,   0, 
    0,   2,   0,   0,   0,   2,   1,   3,   0,   2,   0,   2,   2,   2,   0,   3,   2,   1,   2,   0, 
    1,   1,   3,   0,   1,   3,   1,   2,   0,   3,   2,   1,   0,   0,   1,   1,   1,   1,   1,   1, 
    3,   2,   0,   0,   2,   2,   1,   1,   2,   1,   2,   2,   1,   2,   2,   2,   2,   1,   3,   2, 
    0,   1,   3,   0,   0,   3,   0,   1,   1,   3,   0,   1,   1,   0,   2,   2,   3,   1,   2,   0, 
    1,   3,   3,   0,   1,   0,   0,   3,   3,   3,   3,   1,   0,   0,   0,   3,   2,   2,   3,   2, 
    3,   1,   2,   2,   2,   3,   0,   3,   0,   0,   2,   1,   0,   0,   0,   3,   2,   3,   1,   3, 
    1,   2,   1,   2,   3,   3,   3,   1,   3,   1,   0,   2,   2,   0,   1,   1,   3,   0,   0,   2, 
    0,   1,   0,   1,   2,   1,   0,   3,   3,   3,   2,   3,   2,   2,   3,   3,   1,   3,   1,   0, 
    2,   3,   3,   0,   0,   2,   3,   1,   0,   3,   3,   2,   3,   2,   2,   1,   0,   0,   3,   2, 
    2,   2,   3,   0,   1,   3,   3,   2,   0,   0,   1,   2,   1,   1,   3,   0,   2,   3,   0,   1, 
    1,   2,   1,   1,   0,   0,   2,   0,   3,   0,   2,   0,   0,   2,   1,   1,   0,   0,   1,   0, 
    2,   0,   3,   3,   3,   0,   3,   2,   0,   1,   1,   1,   0,   1,   3,   1,   0,   3,   0,   2, 
    2,   1,   2,   3,   3,   3,   3,   3,   2,   1,   2,   1,   0,   3,   0,   3,   2,   1,   2,   0, 
    0,   2,   3,   3,   1,   1,   1,   1,   3,   2,   2,   1,   3,   0,   0,   2,   2,   2,   2,   3, 
    1,   2,   0,   2,   2,   0,   0,   3,   1,   2,   2,   0,   2,   1,   3,   1,   2,   0,   0,   3, 
    0,   2,   3,   1,   3,   3,   0,   0,   1,   0,   0,   3,   3,   1,   0,   0,   3,   3,   1,   0, 
    2,   1,   2,   2,   3,   3,   0,   3,   3,   3,   0,   0,   2,   3,   0,   0,   2,   1,   1,   3, 
    3,   0,   3,   1,   3,   1,   3,   1,   2,   2,   1,   2,   3,   1,   3,   1,   1,   1,   2,   2, 
    3,   2,   3,   1,   3,   3,   3,   2,   0,   3,   3,   2,   0,   3,   0,   2,   1,   1,   1,   3, 
    0,   3,   0,   2,   3,   3,   0,   3,   2,   0,   2,   1,   2,   0,   0,   3,   3,   3,   1,   0, 
    3,   2,   2,   1,   2,   1,   0,   0,   2,   0,   0,   0,   1,   3,   1,   1,   3,   1,   0,   0, 
    3,   2,   2,   3,   2,   1,   3,   1,   1,   2,   3,   1,   3,   2,   2,   0,   2,   2,   1,   3
};

static data_t verify_data[ARRAY_SIZE] = 
{
  150, 120, 127, 130, 127, 139, 124, 161, 141, 148, 126, 156, 114, 125, 106, 144, 105, 104, 107,  92, 
  121, 151, 162, 110, 107, 111, 138, 118, 125,  98, 165, 128, 118, 149, 120, 163, 124, 135, 144, 155, 
  117, 122, 156, 125, 120, 117, 138, 112,  95, 120, 126, 110, 118, 102, 110, 124, 112, 126, 118, 122, 
  100, 125,  94, 125,  98, 132,  91,  85, 102,  84, 105, 118, 128,  96,  81,  99, 113, 109, 119,  97, 
  136,  98, 110, 136, 112, 131, 108, 105, 110, 110,  83, 108, 107, 106, 111,  95, 102, 112,  97, 104, 
  123, 123, 120, 124,  91, 146, 105, 121, 106, 105, 107, 115, 114,  92, 105, 115,  92, 103,  94,  91, 
  102, 121, 113, 117, 119,  91, 129, 115, 103,  90, 126, 106,  95, 137,  95, 142, 112, 142, 113, 133, 
   98, 132, 132, 118,  97, 107,  99, 109,  85, 102, 137, 121, 110, 111, 101, 143,  96, 118, 142, 123, 
  106, 133, 104, 134, 120, 123, 104, 114, 105, 100, 132, 120, 143, 102, 115, 112, 124, 125, 114, 109, 
  138, 122,  99, 139, 115, 157, 126, 129, 115, 131, 108, 123, 130,  97, 124, 116, 108, 114, 101, 106, 
  113,  98, 111, 108, 104, 127, 108, 118, 103, 116,  98, 118,  91, 124, 102, 126,  92,  82,  85,  76, 
   88, 129, 107, 118,  96,  88, 116, 104,  90,  94, 144,  99, 121, 132, 121, 122, 108, 109, 113, 121, 
   87, 106, 125,  92, 107,  93, 107, 103, 100,  94, 131, 110, 115, 133, 113, 141,  99, 123, 124, 124, 
  123, 135, 101, 119, 108, 129,  83,  92, 109,  87, 110, 122, 129, 107,  95,  93, 122, 114, 124, 103, 
  123, 118, 125, 113, 108, 148, 132, 132, 122, 145,  91, 132, 130,  97, 108, 102, 116, 123,  87, 109, 
  113,  86,  75,  87,  87, 116,  99, 106, 103,  87,  85, 105,  71, 107,  73,  87,  87,  74, 100,  87, 
   94, 110,  99,  96,  83,  83,  89, 103, 112,  84, 112, 107,  88, 106,  82, 113, 110,  99,  99, 106, 
   83,  91,  98,  94,  98,  96,  85, 101,  72,  97, 119, 106,  93, 110, 103, 119,  91, 109,  97, 103, 
   92, 125,  76, 106,  69, 120,  75,  95,  95,  73,  85, 112, 129,  81,  94,  74, 123,  94, 108,  89, 
  116, 106, 107, 104, 115, 129,  97, 121, 112, 137, 104,  96, 115,  93,  91,  89, 107,  94,  81, 101, 
  124, 141, 112, 132, 108, 156, 127, 171, 118, 138, 111, 141, 107, 124, 115, 149,  96, 116, 130,  98, 
  116, 137, 147, 132, 109, 110, 138, 126, 143,  97, 160, 120, 132, 162, 133, 153, 120, 141, 137, 161, 
  116, 117, 138, 111, 131, 111, 133, 107,  94, 111, 165, 138, 107, 130, 107, 157, 104, 135, 126, 134, 
  118, 144, 114, 137, 122, 136, 108, 118,  97, 100, 121, 149, 147, 114, 122,  97, 141, 129, 130, 115, 
  146, 142, 125, 144, 119, 158, 128, 151, 145, 146, 120, 135, 134, 120, 116, 134, 116, 125, 121, 122, 
  133, 113, 102, 114,  92, 146,  98, 121, 123, 113, 100, 111, 117, 107, 109, 134,  93,  97, 107,  84, 
  124, 119, 130, 105, 121, 100, 121, 106, 105, 102, 126, 125, 111, 136, 106, 133, 108, 127, 121, 134, 
  102, 135, 107, 111, 106, 109, 104, 113,  92,  90, 117, 120, 129, 115, 104, 136, 111, 143, 124, 117, 
  100, 109, 105, 104, 111, 136, 105, 103,  94,  99,  98, 117, 136, 123,  90, 105, 129, 124, 116,  99, 
  130, 114, 110, 132,  88, 141, 103, 124, 123, 120,  92, 111, 119, 115,  96,  95, 110, 112, 104,  98, 
  100, 113,  89, 113, 106, 116, 108, 136, 111, 111, 106, 110,  84, 112,  84, 122, 101,  97,  99,  85, 
   87, 111, 100, 112,  89, 106, 108,  94, 109,  90, 114, 104,  99, 117,  98, 121, 105, 118, 111, 119, 
   98, 108,  92, 100, 112,  84,  95, 100,  81,  82, 119, 110, 102, 122, 106, 118, 102, 142, 131, 112, 
  118, 116,  78, 116,  91, 112,  90,  90,  88,  92,  81, 105, 117, 103,  96,  99, 125, 102, 114,  86, 
  115, 119,  77, 119,  86, 133, 122, 115, 118, 111,  99, 114, 119, 108, 103,  78,  98,  99,  99,  90, 
  144, 123, 124, 121, 119, 145, 132, 144, 133, 130, 111, 130,  98, 125,  95, 131, 111, 101, 112,  97, 
  127, 136, 132, 125, 136, 107, 126, 118, 139,  96, 158, 133, 117, 143, 107, 143, 131, 135, 122, 141, 
   99, 137, 111, 121, 120, 122, 105, 128, 109,  98, 117, 114, 121, 101, 110, 130,  98, 123, 115, 105, 
   87, 100,  92,  98,  77, 118,  98, 100,  81,  81,  93, 113, 118,  99,  99,  86, 119, 100, 113,  83, 
  129, 107,  93, 117,  89, 130,  89, 112, 106, 121,  90,  95,  95, 101, 100,  94, 101,  96,  96,  91, 
  138, 113, 125, 114, 103, 128, 103, 133, 135, 122, 112, 121, 100, 118, 112, 124,  97,  82, 108,  91, 
  126, 121, 133, 109, 102, 104, 112, 108, 115,  92, 135, 104, 117, 140,  95, 138, 132, 120, 100, 120, 
   86, 130, 116,  99, 126, 100,  88, 121, 102, 107, 118,  90,  92,  79,  94, 109,  86,  96, 108, 110, 
   94, 115,  75, 102,  93,  99,  83,  77,  86,  73,  86,  99, 105,  73,  84,  68, 103, 102, 100,  81, 
  118, 116,  91, 118,  96, 116,  92, 110,  87,  95,  66,  89,  90,  75,  96,  91,  88,  96,  80,  95, 
  168, 144, 122, 137, 121, 177, 118, 142, 135, 122, 131, 127, 127, 127, 121, 153, 113, 107, 109, 103, 
  133, 145, 157, 129, 128, 118, 146, 134, 136, 128, 141, 145, 116, 148, 103, 151, 123, 143, 141, 154, 
  113, 149, 124, 132, 129, 130, 117, 140, 125, 123, 138, 127, 128, 114, 114, 161, 119, 140, 128, 106, 
  113, 124,  98, 124, 111, 149, 111,  88, 106,  98, 119, 136, 134, 132,  98, 113, 129, 107, 123, 118, 
  144, 104, 125, 129, 114, 148, 111, 131, 123, 137, 104, 122, 116, 113, 119,  95, 116, 127, 119, 105, 
  135, 131, 125, 121, 108, 150, 119, 141, 139, 126, 125, 146, 106, 120, 119, 134, 114,  98, 112, 107, 
  104, 126, 130, 118, 113, 112, 141, 107, 125, 111, 150, 123, 110, 138, 123, 152, 125, 141, 126, 128, 
  110, 132, 138, 122, 111,  96, 117, 129,  97, 111, 100, 100,  89, 101,  90, 121,  90, 113, 116, 104, 
  101, 102,  73, 102, 102, 108,  83,  90,  89,  73,  92, 110, 119,  81,  66, 102,  97,  88,  93,  80, 
  119,  81, 102, 105,  93, 117,  98, 103, 101,  98,  84, 103, 115,  87, 101,  77,  97,  89,  83,  89, 
  147, 136, 147, 109, 126, 140, 135, 149, 134, 129, 113, 131, 113, 113,  91, 153, 118, 112, 106,  85, 
  117, 130, 129, 122, 106, 119, 130, 124, 133, 109, 153, 116, 119, 149, 118, 157, 136, 137, 129, 143, 
   99, 125, 115, 112, 110, 102, 103, 130,  98, 119, 146, 118, 108,  89, 100, 144, 103, 129, 117, 114, 
  107, 123,  94, 114,  99, 125,  95,  96,  92,  98, 114, 135, 135,  98, 103, 102, 126, 106, 109,  89, 
  131, 107, 107, 122, 109, 147, 106, 128, 113, 124, 104, 105, 135, 108, 118,  96, 114,  99, 109, 107, 
  134, 134, 115, 121, 119, 140, 120, 153, 130, 128, 113, 156, 109, 129, 116, 130,  96,  96, 109,  81, 
  101, 133, 131, 118,  89, 109, 138, 121, 132,  91, 155, 123, 121, 156, 115, 155, 136, 126, 130, 138, 
  103, 125, 131, 119, 112, 117, 117, 130,  98, 118, 149, 141, 138, 155, 140, 143, 133, 153, 144, 136, 
  133, 149, 116, 139, 110, 155, 122, 102, 132, 128, 130, 149, 154, 141, 131, 131, 145, 122, 142, 110, 
  157, 134, 124, 152, 129, 157, 134, 151, 131, 161, 120, 146, 142, 141, 140, 107, 120, 134, 124, 122, 
  106, 104, 101,  91,  97, 112, 103, 107, 111,  85, 100, 104,  73,  95,  87, 111,  84,  78,  93, 104, 
   96, 117, 106, 108,  84,  88, 116, 104, 112,  81, 128, 115,  97, 115,  99, 121, 102, 116, 104,  97, 
   98,  96,  95, 100,  96,  81, 112,  93,  92,  83, 127, 119, 109, 115, 107, 126, 118, 126, 118, 100, 
  105, 123,  91, 118,  88, 133,  99,  99, 102,  91, 103, 131, 130, 123, 104, 111, 116, 104, 123,  72, 
  131, 115, 107, 132,  97, 142, 116, 121, 106, 131,  99, 116, 113, 114, 118,  84, 105, 109,  96, 107, 
  129, 109, 121, 122, 116, 136, 125, 143, 135, 126, 112, 128,  93, 112, 115, 122, 100,  92, 113,  98, 
  110, 124, 121, 112,  98, 109, 129, 119, 124, 108, 146, 120, 127, 136, 103, 137, 128, 115, 114, 136, 
  102, 119, 110,  98, 126, 108, 106, 131,  96,  91, 125, 130, 116, 120, 105, 154, 128, 143, 116, 120, 
  112, 137,  96, 119, 114, 150,  99, 109, 107, 103, 100, 132, 116, 124,  99, 105, 136, 111, 118, 109, 
  142, 115, 130, 147, 118, 149, 112, 131, 127, 138,  95, 121, 117, 105, 120, 106, 119, 124,  88, 111, 
  121, 122, 104, 107,  97, 135, 111, 119, 106, 104, 111, 119,  93, 110,  91, 133,  85,  98, 104,  88, 
  109, 116, 126, 105,  95, 100, 105, 116, 115,  87, 131,  99, 100, 135, 110, 126, 107, 129,  99, 110, 
   84, 113, 114, 101, 105,  87, 112,  89,  90, 104, 134, 109, 103, 125, 111, 148, 119, 142, 129, 121, 
   98, 128, 108, 140, 116, 129,  91, 104, 114,  86, 115, 131, 130, 112, 109, 103, 139, 129, 119, 104, 
  141, 122, 110, 148, 112, 151, 123, 123, 135, 146, 104, 125, 125, 121, 124, 118, 105, 124,  96, 114, 
  134, 117, 121, 120, 112, 147,  98, 121, 137, 125, 113, 127,  86, 114,  99, 114, 104, 116, 108,  96, 
   99, 131, 148, 112,  99, 100, 129, 110, 117,  94, 134, 109, 116, 115, 109, 157, 124, 139, 120, 140, 
  119, 119, 124, 113, 111,  93,  99, 108, 108, 101, 128, 125, 119, 120, 102, 133, 118, 133, 113, 119, 
  115, 110, 105, 114,  99, 125,  98,  74,  99,  93, 110, 109, 115, 110, 106, 102, 114, 114, 116,  87, 
  127, 121, 110, 138,  84, 117, 115, 119, 109, 124,  94, 120,  99, 105, 120, 107, 102, 116, 115,  93, 
  105, 102,  96, 125,  85, 106,  90, 121, 118, 124, 103, 121,  82, 117,  88, 109,  86,  87,  92,  71, 
   85, 124, 118,  98,  94,  94, 103,  92,  98,  86, 121,  96, 105, 124,  90, 127, 107, 104, 100, 125, 
   82, 110, 107,  88, 102,  93,  88,  87,  89,  69, 115, 123, 103, 103, 102, 138, 108, 133, 109, 106, 
   95, 127,  91, 111,  97, 133,  97, 112,  97,  81, 113, 124, 114, 109, 100,  93, 124,  96, 118,  78, 
  149, 119, 125, 128, 105, 133,  97, 133, 120, 143, 103, 105, 110, 101, 110, 112, 116, 100,  89,  92, 
  107, 135, 102, 116,  96, 138, 105, 136, 113, 111, 104, 108,  99, 104,  89, 123,  99, 120,  90,  93, 
   92, 107, 102, 117, 100,  96, 145, 113, 107,  92, 126, 116,  98, 131,  93, 132, 101, 119, 127, 137, 
  101, 104, 102, 106,  97, 107, 109, 103,  97,  84, 130, 129, 127, 133, 114, 150, 114, 134, 127, 127, 
  104, 131,  99, 131,  89, 142, 104, 127, 105,  89, 116, 131, 124, 118, 112, 108, 138, 120, 126, 105, 
  132, 112, 123, 140, 118, 166, 121, 144, 127, 157, 102, 125, 114, 114, 116, 109, 110, 120,  84, 109, 
   82, 110,  73,  84,  65,  99,  89, 111,  85,  80,  83,  83,  67,  79,  64,  91,  73,  87,  73,  63, 
   70,  90,  71,  71,  64,  75,  99,  84,  84,  61,  97,  74,  80,  97,  79, 102,  87,  97,  94,  94, 
   77,  66,  91,  90,  78,  74,  82,  66,  65,  67, 127,  98, 119, 119, 122, 115, 109, 139, 125, 133, 
  108, 126, 110, 128, 105, 125,  98,  78,  99,  83, 118, 120, 126, 100,  92,  96, 115, 121, 113,  96, 
  140, 108,  94, 147,  96, 129, 110, 116, 123, 120,  82, 128, 127, 107, 109, 116, 101, 107,  99, 100, 
  125, 129, 115, 124, 118, 137, 108, 141, 130, 135, 101, 142, 106, 116,  97, 136, 119, 108,  98, 114, 
  126, 138, 137, 115, 115, 113, 126, 110, 118, 109, 153, 116, 116, 149, 116, 143, 101, 134, 118, 138, 
  110, 122, 129, 112, 113, 132, 122, 125,  90, 109,  90,  93,  89,  88,  91, 115,  89, 112, 114, 104, 
   90, 111,  74,  97,  85,  99,  84,  98,  79,  67,  84,  89,  93,  95,  79,  85, 110,  98,  94,  76, 
  122,  95,  98, 121,  97, 116, 107, 107,  87,  99,  82, 101, 105,  74,  90,  91,  96, 100,  58,  89, 
  113, 115, 104, 112,  95, 133,  93, 136, 116, 120,  98, 131,  92, 112,  99, 109,  93,  94, 108,  96, 
  100, 110, 117, 101,  91,  94, 114,  93, 107,  97, 137, 108,  99, 137,  92, 138, 103, 117, 124, 130, 
   85, 122, 116,  97,  95, 120,  97, 109,  86,  97, 122, 110, 109, 117, 105, 138,  99, 118, 117, 103, 
   90, 114,  93, 108, 106, 118,  92,  91, 105,  96,  97, 111, 138, 103, 103, 100, 126, 109,  98,  95, 
  133, 116,  90, 136,  95, 124,  99, 110, 116, 123, 103, 115, 113, 104, 102,  93, 101, 114,  97,  99, 
  130, 130, 130, 117, 106, 141, 107, 127, 118, 119, 104, 123,  82, 125,  88, 118, 107,  94, 105,  95, 
  109, 118, 138, 109,  96, 104, 117, 112, 126, 101, 134,  96, 116, 117,  95, 141, 121, 131, 113, 126, 
   98, 117, 113, 100, 110,  96,  95, 120, 110, 108, 138, 124, 120, 109, 113, 168, 108, 151, 152, 137, 
  136, 141, 108, 129, 120, 145, 106, 106, 105,  91, 107, 127, 133, 121,  88, 113, 125, 111, 116, 120, 
  154, 125, 126, 143, 110, 155, 128, 119, 127, 128,  86, 129, 129,  94, 111, 115, 129, 128, 100, 118, 
  135, 133, 111,  95,  89, 139,  98, 135, 111, 105, 111, 116, 105, 106, 114, 119,  82, 109, 109,  79, 
  104,  99, 115,  93,  89,  94, 142, 105, 103, 114, 143, 115, 107, 143, 102, 146, 118, 122, 121, 127, 
   80, 100, 110, 106, 104, 108, 107, 108,  91, 113, 102, 112, 106, 114, 105, 114, 106, 134, 133, 128, 
  106, 138,  98, 128, 103, 126, 108,  95, 100,  90, 102, 120, 121, 102,  90,  99, 116, 105, 119,  97, 
  149, 112, 108, 124, 114, 141, 104, 126, 118, 122, 105, 100, 125, 110,  91, 106, 123, 104,  95,  92, 
  124, 101, 105, 105, 115, 126, 102, 119, 126, 113, 110, 123,  91, 119, 106, 124,  93,  91,  90,  92, 
   95, 129, 116,  96,  86,  97, 123, 109, 112, 103, 133, 118, 101, 117, 101, 141, 105, 127, 120, 112, 
   90, 111, 120, 108,  94,  98, 114, 102, 105, 102, 135, 128, 123, 116, 116, 148, 115, 149, 134, 112, 
  113, 146,  94, 126, 119, 135, 100, 110, 121, 103, 116, 139, 144, 123,  95, 111, 141, 107, 121, 123, 
  156, 111, 127, 143, 123, 165, 127, 139, 138, 132, 101, 138, 121, 114, 111, 110, 117, 124,  99,  98
};


#endif //__DATASET_H