import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class MerchantTip extends StatefulWidget {
  static const termsHtml =
      "<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>Cashback is ineligible when used in conjunction with payment by a Groupon Woolworths voucher or other third party promotional offers &amp; vouchers.</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>Cashback is ineligible on the purchase of gift cards.</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n<p>\n<p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>Cashback may be ineligible if using a coupon not listed on Cashrewards.</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>Cashback is eligible when paying with Dan Murphy's or WISH gift cards.</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p></p></p></p></p></p></p></p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p></p></p></p></p></p></p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p>\n</p>\n<p></p></p></p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>\n<p>You must return and click through from Cashrewards every time you make a new booking/transaction/purchase.</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n<p>\n<p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n</p>\n<p>\n</p>\n<p><p><p><p><p><p><p><p>\r\nNorthern Territory residents ordering for delivery to the Northern Territory, the listing of a product on this site does not constitute an offer to sell that product to you. Prior to any offer or acceptance, additional price checks will be completed and the price of the product may increase to ensure compliance with the Northern Territory Minimum Unit Price Legislation.  This may change the final price calculation for your order.</p></p></p></p></p></p></p>\n";
  static const rateHtml = """
    <div>
      <h2>Pricing</h2>
      <p>Lorem ipsum <b>dolor</b> sit amet.</p>
      <center>
        This is some center text... <abbr>ABBR</abbr> and <acronym>ACRONYM</acronym>
      </center>
      <h2>The Team</h2>
      <p>There isn't <i>really</i> a team...</p>
      <h2>Installation</h2>
      <p>You <u>cannot</u> install a nonexistent product!</p>
      <h2>Don't ask me to find <em>x</em> in</h2>
      <p>log<sub>2</sub>(<em>x</em><sup>2</sup> - 6<em>x</em>) = 3 + log<sub>2</sub>(1 - <em>x</em>)</p>
      <div id="bdi_test">
        <h3><code>bdi</code> and <code>bdo</code> Test:</h3>
        <p>
        In the example below, usernames are shown along with the number of points in a contest.
        If the bdi element is not supported in the browser, the username of the Arabic user would confuse the text (the bidirectional algorithm would put the colon and the number "90" next to the word "User" rather than next to the word "points").
        </p>
        
        <ul>
         <li>User <bdi>hrefs</bdi>: 60 points</li>
         <li>User <bdi>jdoe</bdi>: 80 points</li>
         <li>User <bdi>إيان</bdi>: 90 points</li>
         <bdo dir="rtl">Swapped!</bdo>
         <bdo dir="ltr">This text will go left to right!</bdo>
         <bdo dir="rtl">With bdi: User <bdi>إيان</bdi>: 90 points</bdo>
         <bdo dir="rtl">Without bdi: User إيان: 90 points</bdo>
         <bdo dir="ltr">ltr w/ bdi: User <bdi>إيان</bdi>: 90 points</bdo>
         <bdo dir="ltr">ltr w/o bdi: User إيان: 90 points</bdo>
        </ul>
      </div>
            <div>
              <table>
              <caption>This is the table's caption</caption>
                <tr><th>Head 1<sup>*</sup></th><th>Head 2</th><th>Head 3</th></tr>
                <tr><td>Data 1</td><td>Long Data 2</td><td>Really, realllllly, long data 3</td></tr>
                <tr><td>Data 1</td><td>Long <b>Data</b> 2</td><td>Really, realllllly, long data 3</td></tr>
                <tr><td>Data 1</td><td>Long Data 2</td><td>Really, realllllly, long data 3</td></tr>
                <tr><td>Different 1</td><td>Different reallllllly long 2</td><td>Diff 3</td></tr>
                <tr><td colspan="2">This spans 2 columns</td><td>Normal td</td></tr>
                <tfoot>
                <tr><td>In foot 1</td><td>In foot 2</td><td>In foot long 2</td></tr>
                </tfoot>
              </table>
            </div>
            <div>Nested div</div>
            <div>
            <br />
            <p><q>This is a fancy quote</q></p>
            <br />
            <br />
            Second nested div<br />
            </div>
            <div>Third nested div</div>
          </div>
  """;

  static const tipsHtml =
      "<p><ul><li>Disable your ad blocking software during your shopping sessions.</li><li>Do not visit other websites after clicking through Cashrewards.</li><li>For each new transaction, return and click through to the store again.</li><li>Complete your transaction within 3 hours of clicking through to the store.</li><li>Read the store special terms.</li><li>You may not earn Cashback on GST, freight, delivery fees and taxes.</li><li>You won’t earn Cashback if an order is cancelled, changed or returned.</li><li>Cashback won’t be payable if fraudulent activity is detected.</li></ul></p><p> You <b>may not</b> be eligible for Cashback:</p><p><ul><li>If a gift card is purchased or used as payment.</li><li>If a coupon code is used that is not listed on Cashrewards.</li><li>If your order is not fully completed online or is later changed.</li></ul></p>";

  static const items = [
    {'title': 'Terms', 'content': termsHtml},
    {'title': 'Cashback rates', 'content': rateHtml},
    {'title': 'Cashback tips', 'content': tipsHtml}
  ];

  @override
  _MerchantTipState createState() => _MerchantTipState();
}

class _MerchantTipState extends State<MerchantTip> {
  String _currentTitle = '';
  String _displayHtml = '';

  void _onItemTapped(item) {
    if (_currentTitle != item['title']) {
      setState(() {
        _currentTitle = item['title'];
        _displayHtml = item['content'];
      });
    } else {
      setState(() {
        _currentTitle = '';
        _displayHtml = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: 8,
            bottom: 8,
          ),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: MerchantTip.items
                  .map((item) => InkWell(
                        onTap: () {
                          _onItemTapped(item);
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                          child: Row(
                            children: <Widget>[
                              Text(
                                item['title'],
                                style: TextStyle(
                                    color: _currentTitle == item['title']
                                        ? Theme.of(context).accentColor
                                        : Colors.grey[600]),
                              ),
                              Container(
                                child: Icon(
                                  _currentTitle == item['title']
                                      ? Icons.keyboard_arrow_down
                                      : Icons.chevron_left,
                                  size: 18,
                                  color: _currentTitle == item['title']
                                      ? Theme.of(context).accentColor
                                      : Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
        if (_displayHtml != '')
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            width: double.infinity,
            child: Html(data: _displayHtml),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                    color: Theme.of(context).dividerColor, width: 1)),
          )
      ],
    );
  }
}
