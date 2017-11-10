# -*- coding: utf-8 -*-

import abc


class Handler(metaclass=abc.ABCMeta):

    @abc.abstractmethod
    def handle(self, message):

        """
        Parameters
        ----------
        message : downloadbot_common.messaging.messages.Message

        Returns
        -------
        None

        Raises
        ------
        downloadbot_common.messaging.consuming.exceptions.HandleError
            If there was an error handling the message.
        """

        raise NotImplementedError
