Shout! (from Concourse)
=======================

A notifications gateway for helping your little robot friends to
be heard (from Concourse!)


Resource Type Configuration
---------------------------

Here's how you _install_ this resource into your pipeline /
Concourse:

    resource_types:
      - name: shout
        type: docker-image
        source:
          repository: huntprod/shout-resource
          tag:        latest


Source Configuration
--------------------

  - `url`: _Required_. The full URL (HTTPS or otherwise) of your
    [Shout!][shout] API server.

  - `topic`: _Optional_.  The Shout! topic to post events to.
    If not specified here, this _must_ be specified in the `out`
    parameters.

  - `method`: _Optional_.  How to notify via Shout!.  If given,
    must be one of "event", for break/fix notifications, or
    "announce" for always-sent announcements.

    If not specified here, this _must_ be specified in the `out`
    parameters.

  - `ca`: _Optional_.  A concatenated list of X.509 Certificate
    Authority certificates, PEM-encoded.

  - `insecure`: _Optional_ (and **highly discouraged**).  Skip
    validation of any TLS X.509 certificates presented by the Shout!
    API server.  Try to use `ca` instead.


Examples
--------

Send to the Shout! server at 10.7.8.9, via HTTPS:

    resources:
      - name: bug-somebody
        type: shout
        source:
          uri: https://10.7.8.9
          topic: some-pipeline


Behavior
--------

### `out`: Send an event notification to Shout!

Issues an HTTP(S) request to the Shout! API server to inform it of
a new event, either successful or otherwise.

**Parameters**

  - `topic`: _Optional_.  The Shout! topic to post events to.
    This must be specified if you have not defined a topic at the
    source level (see above).

  - `method`: _Optional_.  How to notify via Shout!.  Must be one
    of "event", for break/fix notifications, or "announce" for
    always-sent announcements.

    Defaults to "event".

  - `message`: _Required_ (but see `file`).  The message text to
    send out.

  - `file`: _Optional_.  A file path that contains the message
    text to send out.  If `file` is given, `message` is ignored
    (and no longer required).

  - `link`: _Optional_.  A URL to be included in the failure /
    success notification messages.

  - `ok`: _Optional_.  Whether or not this event is a successful one
    (`"ok": true`), or a failure (`"ok": false`).  This governs how
    Shout! will react to the event, given the topic's recent
    history.

  - `metadata`: _Optional_.  A key-value map of metadata, which
    can be used by Shout! rules for a richer messaging experience.


[shout]: https://github.com/jhunt/shout
