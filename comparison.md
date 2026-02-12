| Criteria / Feature        | Kargo (Their way)                                | Kargo (Our way)                                                     | Homegrown                                                           |
| ------------------------- | ------------------------------------------------ | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| Argo Target File Location | App repository, dedicated branch per environment | Shared config repository, directory per service and per environment | Shared config repository, directory per service and per environment |
| Deployment Trigger        | Warehouse/repository scan + new image detected   | Github actions trigger                                              | Github actions trigger                                              |

Notes:

- Warehouse/repository scans run on a cron, meaning the make a lot of api calls
- Kargo doesn't appear to have any support for identifying releases as a warehouse trigger
- Using an image + commit hash reference (for configs) is slightly not-obvious
- Cant use shell scripts - kargo steps were hard to debug


comparison fields
- triggers
  - Triggers are both more limited, and a little harder to understand, once you start to include the
    freightExpressionStatements. Also, passing values from freight is not great
- speed
- ecosystem quality (complexity / flexibility)
  - ratio of local code to shared code (GHA has more shared actions, with kargo it might live all in the main repo or
    argocd-infrastructure)
- health checks (kargo also displays the health status, which might be redundant with the argo one)
- UI Experience
  - Kargo
    - Is very pretty
    - Allows for drag-and-drop of deployments to any env without having to wonder "how do trigger this"
    - Sometimes dragging a new freight to a stage fails for a bit
    - some of the ui overlaps
    - sometimes new freight doesn't show in the UI
  - GHA
    - No "default" UI that is accessible
    - Each UI represents a run
    - Not obvious how to trigger a deploy (even though its on image build)
    - Provides more detail into each step than Kargo does - useful when debugging

- It is nice that Kargo deploys using k8s resources
- It is not great that they introduce a whole additional workflow syntax to use when definintion PromotionTasks (we are
  already familiar with GHA syntax)
- Not gonna lie, it Kargo promotion task runs EXTREMELY fast (but that's also running locally)
- Should probably think about how the ability to run testes compares, and also the ability to manage who can and cant
  aprove stuff
