# bot.py
from telegram import Update
from telegram.ext import Updater, CommandHandler, CallbackContext

BOT_TOKEN = ""

def start(update: Update, context: CallbackContext) -> None:
    """Handles the /start command."""
    update.message.reply_text("Hello! I'm your bot. How can I assist you today?")

def help_command(update: Update, context: CallbackContext) -> None:
    """Handles the /help command."""
    update.message.reply_text("Here are the commands you can use:\n"
                              "/start - Start the bot\n"
                              "/help - Show this help message\n"
                              "/hello - Say hello to the bot")

def hello(update: Update, context: CallbackContext) -> None:
    """Handles the /hello command."""
    update.message.reply_text("Hello there! 👋")

def main() -> None:
    """Start the bot."""
    updater = Updater(BOT_TOKEN)
    dispatcher = updater.dispatcher

    # Register command handlers
    dispatcher.add_handler(CommandHandler("start", start))
    dispatcher.add_handler(CommandHandler("help", help_command))
    dispatcher.add_handler(CommandHandler("hello", hello))

    # Start polling for updates
    updater.start_polling()

    # Keep the bot running
    updater.idle()

if __name__ == "__main__":
    main()
