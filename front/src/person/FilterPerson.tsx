import { Button } from "@/components/ui/button";
import { Search } from "lucide-react";

export default function Filter() {
  return (
    <form className="flex items-center gap-2">
      <input type="id" placeholder="ID da Pessoa" />
      <input type="pesspa" placeholder="Nome da Pessoa" />
      <Button type="submit" variant="outline">
        <Search className="w-4 h-3 mr-2 " />
        Filtrar resultados
      </Button>
    </form>
  );
}
