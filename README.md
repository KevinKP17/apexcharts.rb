<p align="center">
  <img src="https://apexcharts.com/media/apexcharts-logo.png" height="90">
  <span style="font-size: 40px; vertical-align: top; margin-right: 10px;">+</span>
  <img src="https://www.ruby-lang.org/images/header-ruby-logo.png">
</p>

<p align="center">
  <a href="https://github.com/styd/apexcharts.rb/blob/master/LICENSE"><img src="https://img.shields.io/badge/License-MIT-brightgreen.svg" alt="License"></a>
  <a href="https://travis-ci.org/styd/apexcharts.rb"><img src="https://travis-ci.org/styd/apexcharts.rb.svg?branch=master" alt="Build Status" /></a>
  <a href="https://rubygems.org/gems/apexcharts"><img src="https://badge.fury.io/rb/apexcharts.svg" alt="Gem Version" /></a>
</p>


<p align="center">Beautiful and interactive web charts for rubyist.</p>


<p align="center"><img src="https://apexcharts.com/media/apexcharts-banner.png"></p>

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'apexcharts'
```

And then execute:
```bash
$ bundle
```

## Usage

### Cartesian Charts

Example series used for cartesian charts:

```erb
<% series = [
  {name: "Inactive", data: @inactive_properties},
  {name: "Active", data: @active_properties}
] %>
```
To build the data, you can use gem [groupdate](https://github.com/ankane/groupdate).  
In my case, it was:

```ruby
@inactive_properties = Property.inactive.group_by_week(:created_at).count
@active_properties = Property.active.group_by_week(:created_at).count
```

and I'll get the data in this format:
```ruby
{
  Sun, 29 Jul 2018=>1,
  Sun, 05 Aug 2018=>6,
  ..
}
```

Example options used for cartesian charts:

```erb
<% options = {
  title: 'Properties Growth',
  subtitle: 'Grouped Per Week',
  xtitle: 'Week',
  ytitle: 'Properties',
  stacked: true
} %>
```

#### Line Chart

```erb
<%= line_chart(series, options) %>
```
![Example Line Chart](images/line_chart.png)


#### Area Chart

```erb
<%= area_chart(series, options) %>
```
![Example Area Chart](images/area_chart.png)


#### Column Chart

```erb
<%= column_chart(series, options) %>
```
![Example Column Chart](images/column_chart.png)


#### Bar Chart

```erb
<%= bar_chart(series, options) %>
```
![Example Bar Chart](images/bar_chart.png)

I don't know if datetime in Y-axis is possible or not in apexcharts.  
If it's possible then I will fix it.


#### Scatter Chart

```erb
<%= scatter_chart(series, options) %>
```
![Example Scatter Chart](images/scatter_chart.png)


#### Mixed Chart

You can mix charts by using `mixed_chart` or `combo_chart` methods. For example:
Given that:
```ruby
@total_properties = Property.group_by_week(:created_at).count
```
you can do this:
```erb
<%= combo_chart({**options, theme: 'palette4', stacked: false, data_labels: false}) do %>
  <% line_chart({name: "Total", data: @total_properties}) %>
  <% area_chart({name: "Active", data: @active_properties}) %>
  <% column_chart({name: "Inactive", data: @inactive_properties}) %>
<% end %>
```
![Example Mixed Chart](images/mixed_chart.gif)


#### Syncing Chart
You can synchronize charts by using `syncing_chart` or `synchronized_chart` methods. For example:
```erb
<%= syncing_chart(chart: {toolbar: false}, height: 250, style: 'display: inline-block; width: 32%;') do %>
  <% mixed_chart(theme: 'palette4', data_labels: false) do %>
    <% line_chart({name: "Total", data: @total_properties}) %>
    <% area_chart({name: "Active", data: @active_properties}) %>
  <% end %>
  <% area_chart({name: "Active", data: @active_properties}, theme: 'palette6') %>
  <% line_chart({name: "Inactive", data: @active_properties}, theme: 'palette8') %>
<% end %>
```
![Example Syncing Chart](images/syncing_chart.gif)


#### Annotations

All charts can have annotations, for example:

```erb
<%= line_chart(series, options) do %>
  <% x_annotation(value: ('2019-01-06'..'2019-02-24'), text: "Busy Time", color: 'green') %>
  <% y_annotation(value: 29, text: "Max Properties", color: 'blue') %>
  <% point_annotation(value: ['2018-10-07', 24], text: "First Peak", color: 'magenta') %>
<% end %>
```
![Example Line Chart with Annotations](images/chart_with_annotations.png)

## Web Support

### Rails

After installing the gem, require it in your `app/assets/javascripts/application.js`.
```js
//= require 'apexcharts'
```

Or, if you use `webpacker`, you can run:
```bash
yarn add apexcharts
```
and then require it in your `app/javascript/packs/application.js`.
```js
require("apexcharts")
```

## Objective
- To bring out as much apexcharts.js capabilities as possible but in ruby ways.

## Roadmap
- Other charts (pie, donut, radar, heatmap, etc.)
- Support other ruby frameworks (sinatra, hanami, etc.)
- Render as Vue or React elements

## Contributing
Everyone is encouraged to help improve this project by:
- Reporting bugs
- Fixing bugs and submiting pull requests
- Fixing documentation
- Suggesting new features

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).