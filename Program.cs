using System;
using System.IO;
using System.Collections.Generic;
using MSE.Assembly;
using MSE;
using MSE.instructionSets;

namespace ASMToMSE32
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Input file here: ");
            Converter converter = new Converter(Console.ReadLine());
            Console.Write("Input where to store the output here: ");
            File.WriteAllBytes(Console.ReadLine(), converter.Compile());
            Console.WriteLine("Compile complete!");
        }
    }
}
