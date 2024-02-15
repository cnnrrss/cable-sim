# Cable Sim Assignment

This is an interesting assignment. I appreciated open-ended questions like these and there are a lot of different avenues to take in completing this. 

Given the 2-3 hour time constraint, my first instinct was to breakdown the task into subtasks to effectively manage my time.

1). [Understand the Basics / Define Objectives](#objectives) \
2). [Choose Simulation Tool(s)](#choose-simulation-tools) \
3). [Simulation Environment Setup](#simulation-environment-setup) \
4). [The Prototype](#the-prototype) \
5). [Follow Up Questions](#follow-up-questions) \
6). [Roadmap](#roadmap)

## Objectives

Gain a basic understanding of how telemetry data is generated, transmitted, and analyzed for Cable networks.

- Determine key metrics
- Identify critical interactions between cable modems and CMTS to simulate to provide meaningful metrics.

Modern Cable network design is focused on solving resource allocation problems to maximize throughput and minimize latency: \
– Rate control \
– Scheduling \
– Power control \
– Interference mitigation

**Why are we doing this?** \
_User experience (throughput, latency) depends on end-to-end details and cross-traffic effects. Packet-level simulators like ns-3 are ideal for these studies._

_To reduce the complexity, a single platform to manage the
life cycle of communication and edge workloads and to effectively monitor and share infrastructure to reduce costs would be ideal._

**Example Cable Network**
<img src="./resources/example-cable-network.png" width="1013"/>

**Key Assumption: For the excercise, focus on a specific depth of the network. Such as the Headend / Hub.**


