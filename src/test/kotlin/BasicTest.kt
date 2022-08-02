import org.antlr.v4.runtime.CharStreams
import org.antlr.v4.runtime.CommonTokenStream
import org.example.shqip.ShqipLexer
import org.example.shqip.ShqipParser
import org.example.shqip.ShqipVisitorImpl
import org.junit.jupiter.api.Test
import kotlin.test.assertEquals

class BasicTest {
    @Test
    fun basicTest() {
        val classLoader = javaClass.classLoader
        val uri = classLoader.getResource("example.shqip")!!

        val inputStream = CharStreams.fromFileName(uri.file)
        val lexer = ShqipLexer(inputStream)
        val commonTokenStream = CommonTokenStream(lexer)
        val parser = ShqipParser(commonTokenStream)

        val ctx = parser.say()
        val visitor = ShqipVisitorImpl()

        val text = visitor.visitSay(ctx)
        println(text)

        assertEquals(text, "je president")
    }
}
