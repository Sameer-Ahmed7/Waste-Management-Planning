# Project Title:
Waste Collection Optimization 

# Overview:
This repository contains the implementation of the Waste Collection Optimization. The project was developed as part of the course **PLANNING AND REASONING**, taught by Professors [Andrea Marella](https://www.diag.uniroma1.it/marrella/) and [Elena Umili](https://www.diag.uniroma1.it/users/elena_umili), as part of my Master’s in AI and Robotics at [Sapienza University of Rome](https://www.uniroma1.it/it/pagina-strutturale/home). The project explores various scenarios and solutions to optimize waste collection using AI planning techniques.

## General Problem

The main objective of the project is to optimize the waste collection process by addressing the following tasks:
- Begin at the initial position (I1).
- Move to room (R1) to collect one piece of garbage.
- Carry the garbage to the respective dustbin (O1, PL1, PA1).
- Continue collecting and disposing of garbage until all is collected or dustbins are full.
- Replace the bag when a dustbin is full, retrieve a new bag from B1, and dispose of the old bag at city bins (OCB1, PLC1, PAC1).
- Trucks from respective dumpyards (OD1, PLD1, PAD1) collect waste from all city bins and transport it back to dumpyards.
<p align="center">
  <img src="https://github.com/Sameer-Ahmed7/Waste-Management-Planning/blob/main/assets/general_problem.png" width="50%" height="50%" title="General Problem Flow Diagram">
  </p>

## Different Problems

The project defines various scenarios with different parameters such as the number of persons, rooms, types of garbage, dustbins, city bins, and trucks. Each problem is analyzed based on total cost and distance cost calculations.
<p align="center">
  <img src="https://github.com/Sameer-Ahmed7/Waste-Management-Planning/blob/main/assets/Different_Problems.png" width="50%" height="50%" title="General Problem Flow Diagram">
  </p>

## Domain
The domain file is different on the basis of metrics:
- Total Cost Only
- Distance Cost Calculation

The domain consists of various objects and actions, including:
- **Objects**: DustBin, Location, Bags, Room, Human, HumanCarry, garbageSubstance, CityBin, Truck, Quantity, Dumpyard.
- **Predicates**: is_loc, have_garbage, garbage_in_bin, bin_full, bin_half, bin_clear, have_newBag, have_oldBag, related, person_hands_full, person_hands_empty, old_bag_dumb, collected_cityBins_garbage, disposed_cityBins_garbage, deposited_bin_garbage, plus1, Truck_capacity, between.
- **Actions**: Move_To_Bin, Move, Move_To_Room, Fill_Bin_Partially, Fill_Bin_Completely, Get_New_Bag, Move_To_Bin_To_Change_Bag, Detach_Old_Bag, Move_Person_To_CityBin, Load_City_Garbage, UnLoad_City_Garbage.

## Metrics

Two different metrics are used in the project:
- **Total Cost Only:** Cost=1 (for every action), Minimize total cost.
  <p align="center">
  <img src="https://github.com/Sameer-Ahmed7/Waste-Management-Planning/blob/main/assets/metrics_1.png" width="50%" height="50%" title="General Problem Flow Diagram">
  </p>
- **Distance Cost Calculation:** Cost depends on distance, Minimize total cost.
  <p align="center">
  <img src="https://github.com/Sameer-Ahmed7/Waste-Management-Planning/blob/main/assets/metrics_2.png" width="50%" height="50%" title="General Problem Flow Diagram">
  </p>

## Planner

### Description
Fast Downward is a PDDL automated planning system that supports classical planning.

### Functionality
Fast Downward operates by translating PDDL descriptions into a graph-search problem. In this process, nodes represent states visited by the planner. It incrementally builds this graph in a forward manner while being guided by a heuristic function. This guidance helps the planner explore only those nodes whose associated states are reachable from the initial state, thus efficiently moving towards achieving the specified goals.

### Operating System Compatibility
Fast Downward is compatible with various operating systems, including Linux, macOS, and Windows.

### Command
The general command for running Fast Downward typically follows this format:

<p align="center">
    <code>./fast-downward.py &lt;domain_file&gt; &lt;problem_file&gt; [options]</code>
</p>

Here,

- **./fast-downward.py:** Command to execute the Fast Downward planner.
- **<domain_file>:** The PDDL file describing the domain.
- **<problem_file>:** The PDDL file describing the problem instance.
- **[options]:** Optional arguments that can be provided to customize the planning process, such as search algorithm selection, heuristic options, etc.

Fast Downward official documentation: [Click Here](https://www.fast-downward.org/)



## Search Algorithm

### Introduction to A*:
- A* is a widely used pathfinding and graph traversal algorithm.
- It is known for its efficiency in finding the shortest path from a start node to a goal node.
- A* combines the benefits of Dijkstra's algorithm and Greedy Best-First-Search by using a heuristic to prioritize nodes.

### Node Expansion: 
Continuously expand the node with the lowest estimated cost 
<p align="center">
    <code>f = g*h</code>
</p>
Where,

- **g:** Cost from the start node to the current node.
- **h:** Heuristic estimate of the cost from the current node to the goal.

### Optimal:
- Optimal if h admissible and consistent.
- If h admissible and reopening is used.

Fast Downward Search Algorithms: [Click Here](https://www.fast-downward.org/Doc/SearchAlgorithm)

> [!NOTE]
> Generally, in Fast Downward, A* uses reopening. There is no method to set reopening to false in A* (Fast Downward), unlike other search algorithms in fast Downward.


## Heuristics

Different heuristics are evaluated, including:
- Optimal Heuristic: Hmax, Blind.
- Non-Optimal Heuristic: Hff, Hadd.

## Evaluation

The project evaluates various parameters such as plan length steps, execution time, generated states, and plan cost.

## Results

### Heuristics

The results are presented for different problems using various heuristics. 
- Blind (A*)
  <p align="center">
  <img src="https://github.com/Sameer-Ahmed7/Waste-Management-Planning/blob/main/assets/heurastic_blind.png" width="50%" height="50%" title="General Problem Flow Diagram">
  </p>
  
  > In problem 7 (N/A) means it is not executable, because of too much complexity planer stop automatically after some hours.

- Hmax (A*)
  <p align="center">
  <img src="https://github.com/Sameer-Ahmed7/Waste-Management-Planning/blob/main/assets/heurastic_hmax.png" width="50%" height="50%" title="General Problem Flow Diagram">
  </p>
  
  > In problem 7 (N/A) means it is not executable, because of too much complexity planer stop automatically after some hours.

- Hadd (A*)
  <p align="center">
  <img src="https://github.com/Sameer-Ahmed7/Waste-Management-Planning/blob/main/assets/heurastic_hadd.png" width="50%" height="50%" title="General Problem Flow Diagram">
  </p>
  
  > hadd executed problem 7.
  
- Hff (A*)
  <p align="center">
  <img src="https://github.com/Sameer-Ahmed7/Waste-Management-Planning/blob/main/assets/heurastic_hff.png" width="50%" height="50%" title="General Problem Flow Diagram">
  </p>
  
  > In problem 7 (N/A) means it is not executable, because of too much complexity planer stop automatically after some hours.

  
### Evaluations


Detailed analysis and comparison.

- Plan Length Step(s)
  <p align="center">
  <img src="https://github.com/Sameer-Ahmed7/Waste-Management-Planning/blob/main/assets/plan_length_step.png" width="50%" height="50%" title="General Problem Flow Diagram">
  </p>
- Generated States (s)
  <p align="center">
  <img src="https://github.com/Sameer-Ahmed7/Waste-Management-Planning/blob/main/assets/generated_states.png" width="50%" height="50%" title="General Problem Flow Diagram">
  </p>

- Execution Time (Seconds)
  <p align="center">
  <img src="https://github.com/Sameer-Ahmed7/Waste-Management-Planning/blob/main/assets/execution_time.png" width="50%" height="50%" title="General Problem Flow Diagram">
  </p>

- Cost
  <p align="center">
  <img src="https://github.com/Sameer-Ahmed7/Waste-Management-Planning/blob/main/assets/cost.png" width="50%" height="50%" title="General Problem Flow Diagram">
  </p>

## Problems

- **Problem 1:** Single person, single room, organic garbage, total cost only.
- **Problem 2:** Single person, single room, two types of garbage, total cost only.
- **Problem 3:** Single person, single room, three types of garbage, total cost only.
- **Problem 4:** Two persons, two rooms, three types of garbage, total cost only.
- **Problem 5:** Two persons, two rooms, three types of garbage, two city bins, total cost only.
- **Problem 6:** Two persons, two rooms, three types of garbage, two city bins, distance cost calculation.
- **Problem 7:** Three persons, three rooms, three types of garbage, two city bins, distance cost calculation.

## Conclusion

This project demonstrates the application of planning algorithms to optimize the waste collection process. Various scenarios and metrics provide insights into the efficiency and effectiveness of different planning strategies.

