class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260510-023104"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "27fb630644840eacec58dc0d2de86f076ea76c6db65ad8fcae15ec39261c4de2"
    sha256 cellar: :any_skip_relocation, sequoia:      "e8acee2cb2f1f6047208628e641711d1630a2c400a2f3f9aa9be9ab932d35244"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d259523aef98dc51a161c3850257cb4372a9236b04057ad0c2bf51add97046a1"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "81641a6ef015d8ffba99de25c81bac830f4c255e4527c8665b419556d6ecbc7c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "38500f76294b4ce1c5e91824e2a664d7d7a2e8b7d2c4be37cddf63c11742ceb3" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "10ae629bd93c2702af210baa8992dc9ef53ca444535cbec71fa4a9d657c709dc" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.269+ebff43698.tar.xz"
  version "0.17.0-dev.269+ebff43698"
  license "MIT"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on macos: :big_sur # https://github.com/ziglang/zig/issues/13313
  depends_on "z3"
  depends_on "zstd"

  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install "lib" => "zig"
  end
end
