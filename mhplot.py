#!/usr/bin/env python # [1]
"""\
This script plots the memory hierarchy diagram according to the input data file. 
The input data file should be in the following format:
TODO: add format

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
    parser.add_argument('-n', '--name', 
        default="mhplot.png",
        help="The name of the plot file, default is mhplot.png"
    )
    parser.add_argument('-L1', default=32, help="Size of L1 Cache with unut of KB")
    parser.add_argument('-L2', default=256, help="Size of L2 Cache with unut of KB")
    parser.add_argument('-L3', default=2560, help="Size of L3 Cache with unut of KB")
    parser.add_argument('-log', action="store_true", help="Draw the log of the data")
    args = parser.parse_args()

    # read the data file and plot
    for file, label in zip(args.files, args.labels):
        data = read_data(file) 
        # plot the memory hierarchy diagram 
        mem_size = [pair[0] for pair in data]
        flops = [pair[1] for pair in data]
        plt.plot(mem_size, flops, marker='o', linestyle='-', label=label)  

    plt.xlabel('Memory [kBytes]')
    plt.ylabel('Performance [Mflops/s]')
    plt.axvline(x=args.L1, color='r', linestyle='--', linewidth=1, label="L1 cache")
    plt.axvline(x=args.L2, color='r', linestyle='--', linewidth=1, label="L2 cache")
    plt.axvline(x=args.L3, color='r', linestyle='--', linewidth=1, label="L3 cache")
    if args.log: 
        plt.xscale('log')
    plt.legend(args.labels)
    plt.title('Perfomance Matrix Multiplication')
    # plt.show()
    plt.savefig(args.name)