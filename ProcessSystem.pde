Agent[] agents;
int agentCount = 1000;

void setup()
{
  size(500, 500);

  agents = new Agent[agentCount];

  for (int i = 0; i < agentCount; i++)
  {
    agents[i] = new Agent();
  }
}

void draw()
{

  background(255);

  for (int i = 0; i < agentCount; i++)
  {
    agents[i].update();
  }
}

