# Copyright 2014-2021 The Salish Sea MEOPAR Contributors
# and The University of British Columbia

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#    https://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
"""Pyramid web app that serves the midoss-app development server
"""
__version__ = "1.0.dev0"

import datetime
import os

import sentry_sdk
from pyramid.config import Configurator
from pyramid.static import static_view
from sentry_sdk.integrations.pyramid import PyramidIntegration

sentry_sdk.init(dsn=os.environ.get("SENTRY_DSN"), integrations=[PyramidIntegration()])


def main(global_config, **settings):
    """Configure the Pyramid WSGI application."""
    config = Configurator(settings=settings)
    _static_views(config, settings)
    _copyright_year_range(config)
    _site_routes(config)
    _midoss_routes(config)
    _about_site_routes(config)
    _figure_server(config)
    config.scan()
    return config.make_wsgi_app()


def _static_views(config, settings):
    config.add_static_view(name="static", path="midoss-app-dev:static")
    config.add_static_view(
        name=settings["midoss_tiles_server_name"],
        path="/results/midoss-app-dev/tiles",
    )


def _copyright_year_range(config):
    def _add_copyright_year_range(request):
        return (
            "2013"
            if datetime.date.today().year == 2013
            else "2013-{:%Y}".format(datetime.date.today())
        )

    config.add_request_method(_add_copyright_year_range, "copyright_years", reify=True)


def _site_routes(config):
    config.add_route("site.index", "/")


def _midoss_routes(config):
    config.add_route("heading.subheading", "folder/subfolder/{variable}")


def _about_site_routes(config):
    config.add_route("about.contributors", "contributors")
    config.add_route("about.publications", "publications")
    config.add_route("about.license", "license")


def _figure_server(config):
    config.add_view("midoss-app-dev._figure", route_name="figure")
    config.add_route("figure", "/*subpath")


_figure = static_view("/var/www/html/midoss-app-dev/figures", use_subpath=True)
