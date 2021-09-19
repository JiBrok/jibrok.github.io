---
title: Cloud discount calculator
tags: cloud
---


<html>
<head>
    <script src="https://code.jquery.com/jquery-2.2.4.min.js"
            integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
</head>

<div id="cycle" style="width: 100%; margin-bottom: 20px">
    <label>Billing cycle:</label>
    <select class="cycle" style="width: 100%; margin-bottom: 20px">
        <option value="monthly" selected="selected">Monthly</option>
        <option value="annual">Annual</option>
    </select>
</div>


<div id="apps" style="width: 100%; margin-bottom: 20px">
    <label>Cloud apps:</label>
    <select class="apps" multiple="multiple" style="width: 100%; margin-bottom: 20px">
        <option value="jbcf">Calculated and other custom fields(JBCF) for Jira DC/Cloud</option>
        <option value="stopwatch">Stopwatch field for Jira Cloud</option>
        <option value="time-between-dates">Time between dates for Jira Cloud</option>
        <option value="tis" selected="selected">Time in status | SLA | Timer | Stopwatch for Jira DC/Cloud</option>
        <option value="timer" selected="selected">Timer field | SLA for Jira Cloud</option>
    </select>
</div>


<div id="users" style="width: 100%; margin-bottom: 20px">
    <label>How many users do you have?</label>
    <input class="users" value="100" type="number" min="0" max="20000" style="width: 100%; margin-bottom: 20px"/>
</div>

<table id="table">
    <thead></thead>
</table>

<div>
    <b>To get a promo code for a discount, <a target="_blank" href="https://jibrok.atlassian.net/servicedesk/customer/portal/9/group/41/create/138">please contact support</a>.</b>
</div>


<script>

    $(document).ready(function () {
        $('.apps').select2();
        $('.cycle').select2();
        $('.apps').on('change', function () {
            calculate()
        });
        $('.cycle').on('change', function () {
            calculate()
        });
        $('.users').on('change', function () {
            calculate()
        });

        calculate()
    });

    appNames = {
        jbcf: "Calculated and other custom fields(JBCF) for Jira DC/Cloud",
        stopwatch: "Stopwatch field for Jira Cloud",
        "time-between-dates": "Time between dates for Jira Cloud",
        tis: "Time in status | SLA | Timer | Stopwatch for Jira DC/Cloud",
        timer: "Timer field | SLA for Jira Cloud"
    }

    basePrices = {
        jbcf: [
            {
                tier: 10,
                userPrice: 3,
                isStartedLicense: true
            }, {
                tier: 100,
                userPrice: 0.3
            }, {
                tier: 250,
                userPrice: 0.25
            }, {
                tier: 1000,
                userPrice: 0.15
            }, {
                tier: 2500,
                userPrice: 0.10
            }, {
                tier: 5000,
                userPrice: 0.10
            }, {
                tier: 7500,
                userPrice: 0.05
            }, {
                tier: 10000,
                userPrice: 0.05
            }, {
                tier: 15000,
                userPrice: 0.05
            }, {
                tier: 20000,
                userPrice: 0.05
            }
        ],
        stopwatch: [
            {
                tier: 10,
                userPrice: 3,
                isStartedLicense: true
            }, {
                tier: 100,
                userPrice: 0.35
            }, {
                tier: 250,
                userPrice: 0.25
            }, {
                tier: 1000,
                userPrice: 0.20
            }, {
                tier: 2500,
                userPrice: 0.15
            }, {
                tier: 5000,
                userPrice: 0.15
            }, {
                tier: 7500,
                userPrice: 0.15
            }, {
                tier: 10000,
                userPrice: 0.10
            }, {
                tier: 15000,
                userPrice: 0.10
            }, {
                tier: 20000,
                userPrice: 0.10
            }
        ],
        "time-between-dates": [
            {
                tier: 10,
                userPrice: 3,
                isStartedLicense: true
            }, {
                tier: 100,
                userPrice: 0.35
            }, {
                tier: 250,
                userPrice: 0.25
            }, {
                tier: 1000,
                userPrice: 0.20
            }, {
                tier: 2500,
                userPrice: 0.15
            }, {
                tier: 5000,
                userPrice: 0.15
            }, {
                tier: 7500,
                userPrice: 0.15
            }, {
                tier: 10000,
                userPrice: 0.10
            }, {
                tier: 15000,
                userPrice: 0.10
            }, {
                tier: 20000,
                userPrice: 0.10
            }
        ],
        tis: [
            {
                tier: 10,
                userPrice: 3,
                isStartedLicense: true
            }, {
                tier: 100,
                userPrice: 0.35
            }, {
                tier: 250,
                userPrice: 0.25
            }, {
                tier: 1000,
                userPrice: 0.20
            }, {
                tier: 2500,
                userPrice: 0.15
            }, {
                tier: 5000,
                userPrice: 0.15
            }, {
                tier: 7500,
                userPrice: 0.15
            }, {
                tier: 10000,
                userPrice: 0.10
            }, {
                tier: 15000,
                userPrice: 0.10
            }, {
                tier: 20000,
                userPrice: 0.10
            }
        ],
        timer: [
            {
                tier: 10,
                userPrice: 3,
                isStartedLicense: true
            }, {
                tier: 100,
                userPrice: 0.35
            }, {
                tier: 250,
                userPrice: 0.25
            }, {
                tier: 1000,
                userPrice: 0.20
            }, {
                tier: 2500,
                userPrice: 0.15
            }, {
                tier: 5000,
                userPrice: 0.15
            }, {
                tier: 7500,
                userPrice: 0.15
            }, {
                tier: 10000,
                userPrice: 0.10
            }, {
                tier: 15000,
                userPrice: 0.10
            }, {
                tier: 20000,
                userPrice: 0.10
            }
        ],
    }

    packs = [
        {
            name: "Time in status full pack",
            apps: ["stopwatch", "time-between-dates", "tis", "timer"],
            // basePrice: [1, 1.5, 1.75, 2]
            basePrice: [1, 0.5, 0.25, 0.25]
        }
    ]

    // basePack = [1, 1.75, 2.50, 3, 3.4, 3.8, 4.2, 4.5, 4.8, 5]
    basePack = [1, 0.9, 0.8, 0.7, 0.6, 0.5, 0.4, 0.3, 0.2, 0.2]

    startPriceIfHasFullPack = 0.8
    startPriceIfHasPack = 0.9


    function calculate() {

        let apps = $('.apps').val()
        let users = $('.users').val()
        let cycle = $('.cycle').val()
        //todo validate users
        if (apps == null || apps.length == 0 || users == 0) {
            return
        }
        let totalBasePrices = []
        for (let i = 0; i < apps.length; i++) {
            totalBasePrices.push(
                {
                    app: apps[i],
                    basePrice: getBasePriceForApp(apps[i], users)
                }
            )
        }

        // console.log(totalBasePrices)
        // console.log("add discount")
        totalBasePrices = addDiscountInfo(totalBasePrices);
        // console.log(totalBasePrices)
        let endTotal = 0;
        let baseTotal = 0;
        for (let i = 0; i < totalBasePrices.length; i++) {
            baseTotal += totalBasePrices[i].basePrice;
            let appPrice = totalBasePrices[i].basePrice;
            for (let j = 0; j < totalBasePrices[i].discount.length; j++) {
                if (totalBasePrices[i].totalDiscount == null) {
                    totalBasePrices[i].totalDiscount = 1;
                }
                totalBasePrices[i].totalDiscount *= totalBasePrices[i].discount[j]
                appPrice *= totalBasePrices[i].discount[j]
            }
            totalBasePrices[i].endPrice = appPrice;

            endTotal += appPrice;
        }

        let data = {
            baseTotal: baseTotal,
            endTotal: endTotal,
            apps: totalBasePrices,
            users: users,
            cycle: cycle
        }

        generateTable(data)
    }

    function generateTable(data) {
        let html = '';


        html += '<thead><tr><th>App</th><th>Base price</th><th>Price with discount</th><th>Discount</th></tr></thead>' +
            '<tbody>';

        for (let i = 0; i < data.apps.length; i++) {
            html += '<tr><td>' + appNames[data.apps[i].app] + '</td><td>' +
                showPrices(data.apps[i].basePrice, data.users, data.cycle, false) +

                '</td><td>' +

                showPrices(data.apps[i].endPrice, data.users, data.cycle, false) +

                '</td><td>' + (parseInt(getAround(1 - data.apps[i].endPrice / data.apps[i].basePrice) * 100)) + ' % </td></tr>';
        }
        html += '<tr><td><b>Total</b></td><td style="background: #FFEBE6;">' +
            showPrices(data.baseTotal, data.users, data.cycle, true) +
            '</td><td style="background: #E3FCEF;">' +
            showPrices(data.endTotal, data.users, data.cycle, true) + '</td><td>' +
            "<b>" + (parseInt(getAround(1 - data.endTotal / data.baseTotal) * 100)) + ' % </b></td></tr>';
        html += "</tbody>"
        $('#table').html(html)
    }

    function showPrices(price, users, cycle, bold) {
        if(bold){
            if(cycle == "monthly") {
                return "<b>$" + getAround(price / users) + ' per user (average)' + '<br/>' +
                    "$" + ("" + getAround(price)).replace(".00", "") + ' a month<br/></b>';
            } else {
                return "<b>$" + getAround(price * 10 / 12 / users) + ' per user (average)' + '<br/>' +
                    "$" + ("" + getAround(price * 10)).replace(".00", "") + ' a year<br/></b>';
            }
        }
        if(cycle == "monthly") {
            return "$" + getAround(price / users) + ' per user (average)' + '<br/>' +
                "$" + ("" + getAround(price)).replace(".00", "") + ' a month<br/>';
        } else {
            return "$" + getAround(price * 10 / 12 / users) + ' per user (average)' + '<br/>' +
                "$" + ("" + getAround(price * 10)).replace(".00", "") + ' a year<br/>';
        }

    }

    function getAround(number) {
        return parseFloat(number).toFixed(2);
    }

    function addDiscountInfo(appBasedPrices) {
        appBasedPrices.sort(function (firstValue, secondValue) {
            if (firstValue.basePrice > secondValue.basePrice) {
                return 1;
            } else if (firstValue.basePrice < secondValue.basePrice) {
                return -1;
            } else {
                if (firstValue.app.length > secondValue.app.length) {
                    return 1;
                } else if (firstValue.app.length < secondValue.app.length) {
                    return -1;
                } else {
                    return 0;
                }
            }
        })
        appBasedPrices = appBasedPrices.reverse();

        let packs = copyPacks();
        let isStartPriceIfHasFullPack = false
        let isStartPriceIfHasPack = false;
        for (let i = 0; i < appBasedPrices.length; i++) {
            let app = appBasedPrices[i].app;
            for (let j = 0; j < packs.length; j++) {
                let pack = packs[j];
                let index = pack.apps.indexOf(app);
                if (index > -1) {
                    let discountIndex = pack.discountIndex
                    if (discountIndex == null) {
                        discountIndex = 0;
                    }
                    appBasedPrices[i].discount = [pack.basePrice[discountIndex]];
                    discountIndex++;
                    pack.discountIndex = discountIndex;
                    if (discountIndex > 1) {
                        isStartPriceIfHasPack = true;
                    } else if (discountIndex == pack.basePrice.length) {
                        isStartPriceIfHasFullPack = true;
                    }
                }
            }
        }

        let appsWithoutPack = 0;
        for (let i = 0; i < appBasedPrices.length; i++) {
            if (appBasedPrices[i].discount == null) {
                if (isStartPriceIfHasFullPack) {
                    appBasedPrices[i].discount = [startPriceIfHasFullPack]
                } else if (isStartPriceIfHasPack) {
                    appBasedPrices[i].discount = [startPriceIfHasPack]
                } else {
                    appBasedPrices[i].discount = []
                }

                appBasedPrices[i].discount.push(basePack[appsWithoutPack]);
                appsWithoutPack++;
            } else {
                appsWithoutPack++;
            }
        }
        return appBasedPrices;
    }

    function copyPacks() {
        return JSON.parse(JSON.stringify(packs))
    }


    function getBasePriceForApp(app, users) {
        let total = 0;
        let appPrices = basePrices[app];
        let prevTier = 0;
        for (let i = 0; i < appPrices.length; i++) {
            let appPrice = appPrices[i];
            let priceCurrentTier = appPrice.userPrice;
            let isStartedLicense = appPrice.isStartedLicense;
            let needStartedLicense = users <= 10;
            if (appPrice.tier <= users) {
                if (needStartedLicense) {
                    total += priceCurrentTier;
                } else if (isStartedLicense) {
                    continue
                }

                total += (appPrice.tier - prevTier) * priceCurrentTier;
                prevTier = appPrice.tier;
            } else {
                total += (users - prevTier) * priceCurrentTier;
                break
            }
        }
        return total;
    }
</script>

<script>

</script>
</html>




