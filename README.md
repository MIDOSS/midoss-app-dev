# midoss-app-dev

Code and documentation for the dynamic visualization web app based on the Pyramid framework and the OpenLayers library.

## Demo Deployment Notes

Notes re: deployment of demo version of app on `skookum` for 19-Jul-2021 MIDOSS Stakeholders Workshop.
Some steps require `sudo` access,
and messing around with pre-creation of directories via `mkdir` and adjustment of ownership from `root:root` to `dlatorne:sallen`.

1. Clone repo from GitHub into `/SalishSeaCast/`

2. Create symlink in app code directory to Ben's tiles assets directory tree:
    ```bash
    $ ln -s /ocean/bmoorema/research/MEOPAR/data/midoss-app/tiles /SalishSeaCast/midoss-app-dev/midoss_app/tiles
   ```

3. Create conda env:
    ```bash
    $ cd /SalishSeaCast/midoss-app-dev/
    $ conda env create --prefix /SalishSeaCast/midoss-app-env -f envs/environment-deploy.yaml
   ```

4. Activate conda env and do editable install of app in env:
    ```bash
    $ conda activate /SalishSeaCast/midoss-app-env
    (midoss-app-env)$ python3 -m pip install -e /SalishSeaCast/midoss-app-dev
   ```

5. Add reverse proxy directives to `/etc/apache2/sites-enabled/000-default.conf`:
   ```
   # salishsea.eos.ubc.ca/midoss - MIDOSS Monte Carlo fields viz demo app                                                                                                                                                                                                                                                       
   ProxyPass /midoss http://salishsea.eos.ubc.ca:5050/midoss
   ProxyPassReverse /midoss http://salishsea.eos.ubc.ca:5050/midoss
   ```
   
6. Create directory to hold log files:
   ```bash
   $ mkdir /SalishSeaCast/logs/midoss-app/
   ```

7. Start a `tmux` session to run the app in:
   ```bash
   $ tmux new -s midoss-app
   ```
   Activate the environment in the `tmux` session,
   and launch the app using the production configuration:
   ```bash
   $ conda activate /SalishSeaCast/midoss-app-env
   (midoss-app-env)$ cd /SalishSeaCast/midoss-app-dev/
   (midoss-app-env)$ pserve production.ini
   ```
   
   To re-attach to the `tmux` session, use:
   ```bash
   $ tmux attach -t midoss-app
   ```
