#!/usr/bin/env python # [1]
"""\
This script plots the memory hierarchy diagram according to the input data file. 
The input data file should be in the following format:
TODO: add format

TODO: If multiple data files are given, 
the script will plot all of them in the same figure.

TODO: customize plot name

Usage: myscript.py file.dat file2.dat file3.dat
"""

from matplotlib import pyplot as plt
import sys
import argparse

def read_data(datafile: str):
    """Read data from datafile and return a list of lists."""
    data = []
    with open(datafile, 'r') as f:
        for line in f:
            parts = line.strip().split()
            data_point = [float(parts[0]), float(parts[1])]
            data.append(data_point)
    return data


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print(__doc__)
        sys.exit(1)
    parser = argparse.ArgumentParser(
        description="Plot data from multiple files with labels."
    )
    parser.add_argument('files', nargs='+', help="Path to data files")
    parser.add_argument('-l', '--labels', 
        nargs='+', 
        help='Labels for the data files'
    )
    args = parser.parse_args()

    print(args)
    # exit(1)
    
    # read the data file and plot
    for file, label in zip(args.files, args.labels):
        data = read_data(file) 
        # plot the memory hierarchy diagram 
        mem_size = [pair[0] for pair in data]
        flops = [pair[1] for pair in data]
        plt.plot(mem_size, flops, marker='o', linestyle='-', label=label)  
    #TODO read the memory hierarchy data: L1 Cache etc.

    plt.xlabel('Memory [kBytes]')
    plt.ylabel('Performance [Mflops/s]')
    plt.legend(args.labels)
    plt.title('Perfomance Matrix Multiplication')
    # plt.show()
    plt.savefig('mhplot.png')