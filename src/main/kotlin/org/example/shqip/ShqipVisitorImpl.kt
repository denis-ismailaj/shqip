package org.example.shqip

class ShqipVisitorImpl: ShqipBaseVisitor<String>() {
    override fun visitSay(ctx: ShqipParser.SayContext): String {
        return ctx.text().text
    }
}
