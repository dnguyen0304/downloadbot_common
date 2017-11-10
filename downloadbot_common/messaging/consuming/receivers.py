# -*- coding: utf-8 -*-

import abc


class Receiver(metaclass=abc.ABCMeta):

    @abc.abstractmethod
    def receive(self):

        """
        Receive gets a message from the queue.

        Returns
        -------
        downloadbot_common.messaging.messages.Message

        Raises
        ------
        downloadbot_common.messaging.consuming.exceptions.ReceiveTimeout
            If the operation took too long to receive the configured
            number of messages.
        """

        raise NotImplementedError
