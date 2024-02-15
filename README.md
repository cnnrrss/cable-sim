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

## Choose Simulation Tool(s)

Next step is to evaluate the suggested simulation modules including: NS-3, Shadow, and others.

Ultimately, there is a lot of research in this space that I'm not privy to. 
I settled pretty quickly on _shadow_ purely based on a personal bias for wanting to delve into Rust, and also the impression from their docs appeared the most modern. 
If this were "real life" decision making, I'd be more methodical spike out a simulation for our use case with each tool to ensure it met requirements. 

I'd also take into consideration other factors like: Ease of use, Performance, Community support, etc.

However, although the documentation briefly mentions Docker support and a quasi-Dockerfile in their GHA CI pipelines, I got errors running the tests and decided to look at NS-3.

The impression I got from NS-3 was that this is the industry standard, and _most likely_ fits our use case better. To my surprise, [this legend](https://github.com/emanuelegiona/ns3-base-docker) created a useable Docker image today!

## Simulation Environment Setup

Docker is faster and more portable, and more lightweight than spinning up a full linux VM which is key for rapid proto-typing.

```
docker compose up --build --force-recreate 
```

## The Prototype

I picked out a few key non-functional requirements from the challenge description:

- On-demand access to subsets of data
- PB Scale
- High availability - shouldn't tax network
- No centralized storage

**Key Assumption: True de-centralized storage, such as a Torrent protocol, is out of scope for this excercise. Instead I went with a _distributed_ system.**

For these requirements, my instinct tells me using a SQL Data Warehouse like: Druid, Snowflake, AWS Redshift, or BigQuery, etc. Each of these solutions enables OLAP queries in milliseconds on high-cardinality and high-dimensional data sets with billions to trillions of rows without pre-defining or caching queries in advance. The selection would come down to who the users are, what are the latency requirements for queries, what is the cost sensitivity and operations capacity,
the other parts of the tech stack ecosystem.

**Initial Stack**


### Environment Setup
```
cd ns-3
docker build . -t ns3-ub22.04
```

## Follow Up Questions
- How far along is vCCAP? Have cable providers adopted this or are the Headend/Hubs still running dedicated traditional Communication Technology hardware?

## Roadmap

### High Level System Design

A log indexing Data Pipeline fed from nodes of a Cable Network might look something like this:

<img src="./resources/system-design.svg"/>
